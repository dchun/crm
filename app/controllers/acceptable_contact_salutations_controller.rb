class AcceptableContactSalutationsController < ApplicationController
  before_action :set_acceptable_contact_salutation, only: [:show, :edit, :update, :destroy]

  # GET /acceptable_contact_salutations
  # GET /acceptable_contact_salutations.json
  def index
    @acceptable_contact_salutations = AcceptableContactSalutation.all
  end

  # GET /acceptable_contact_salutations/1
  # GET /acceptable_contact_salutations/1.json
  def show
  end

  # GET /acceptable_contact_salutations/new
  def new
    @acceptable_contact_salutation = AcceptableContactSalutation.new
  end

  # GET /acceptable_contact_salutations/1/edit
  def edit
  end

  # POST /acceptable_contact_salutations
  # POST /acceptable_contact_salutations.json
  def create
    @acceptable_contact_salutation = AcceptableContactSalutation.new(acceptable_contact_salutation_params)

    respond_to do |format|
      if @acceptable_contact_salutation.save
        format.html { redirect_to @acceptable_contact_salutation, notice: 'Acceptable contact salutation was successfully created.' }
        format.json { render :show, status: :created, location: @acceptable_contact_salutation }
      else
        format.html { render :new }
        format.json { render json: @acceptable_contact_salutation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acceptable_contact_salutations/1
  # PATCH/PUT /acceptable_contact_salutations/1.json
  def update
    respond_to do |format|
      if @acceptable_contact_salutation.update(acceptable_contact_salutation_params)
        format.html { redirect_to @acceptable_contact_salutation, notice: 'Acceptable contact salutation was successfully updated.' }
        format.json { render :show, status: :ok, location: @acceptable_contact_salutation }
      else
        format.html { render :edit }
        format.json { render json: @acceptable_contact_salutation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acceptable_contact_salutations/1
  # DELETE /acceptable_contact_salutations/1.json
  def destroy
    @acceptable_contact_salutation.destroy
    respond_to do |format|
      format.html { redirect_to acceptable_contact_salutations_url, notice: 'Acceptable contact salutation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acceptable_contact_salutation
      @acceptable_contact_salutation = AcceptableContactSalutation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acceptable_contact_salutation_params
      params.require(:acceptable_contact_salutation).permit(:salutation)
    end
end
