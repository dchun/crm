class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
    
  # GET /schools
  # GET /schools.json
  def index
    @search = School.with_contacts.search(params[:q])
    @order = (params[:q] && params[:q][:s]) ? params[:q][:s] : 'name asc'
    @schools = @search.result.order(@order).page(params[:page]).per(25)
    # @export_headers = params[:export]

    respond_to do |format|
      format.html
      format.csv { send_data @schools.to_csv }
      format.xls { send_data @schools.to_csv(col_sep: "\t") }
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def locate
    schools = School.not_geocoded.limit(2500)
    Delayed::Job.enqueue(GeocodeJob.new(schools.collect(&:id)), priority: 10)
    redirect_to schools_path, notice: "2,500 Schools have been added to the #{view_context.link_to 'queue', delayed_job_path}. If there aren't any other workers, the job will finish in roughly 45 minutes. Please wait a full 24 hours to geocde the next batch."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :state_rank, :national_rank, :college_readiness_score, :tested_ap_ib, :pass_ap_ib, :math_score, :math_proficient, :math_not_proficient, :reading_score, :reading_proficient, :reading_not_proficient, :student_teacher_ratio, :street_address, :city, :state, :zip, :latitude, :longitude, :total_enrollment, :total_economically_disadvantaged, :receives_title_i_funding, :ap_student_performance_participation_rate, :ap_student_performance_participant_passing_rate, :ap_student_performance_exam_per_test_taker, :ap_student_performance_exam_pass_rate, :district_id)
    end
end
