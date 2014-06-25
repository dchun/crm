class AcceptableContactPositionsController < ApplicationController
  before_action :set_acceptable_contact_position, only: [:show, :edit, :update, :destroy]

  # GET /acceptable_contact_positions
  # GET /acceptable_contact_positions.json
  def index
    @acceptable_contact_positions = AcceptableContactPosition.all
  end

  # GET /acceptable_contact_positions/1
  # GET /acceptable_contact_positions/1.json
  def show
  end

  # GET /acceptable_contact_positions/new
  def new
    @acceptable_contact_position = AcceptableContactPosition.new
  end

  # GET /acceptable_contact_positions/1/edit
  def edit
  end

  # POST /acceptable_contact_positions
  # POST /acceptable_contact_positions.json
  def create
    @acceptable_contact_position = AcceptableContactPosition.new(acceptable_contact_position_params)

    respond_to do |format|
      if @acceptable_contact_position.save
        format.html { redirect_to @acceptable_contact_position, notice: 'Acceptable contact position was successfully created.' }
        format.json { render :show, status: :created, location: @acceptable_contact_position }
      else
        format.html { render :new }
        format.json { render json: @acceptable_contact_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acceptable_contact_positions/1
  # PATCH/PUT /acceptable_contact_positions/1.json
  def update
    respond_to do |format|
      if @acceptable_contact_position.update(acceptable_contact_position_params)
        format.html { redirect_to @acceptable_contact_position, notice: 'Acceptable contact position was successfully updated.' }
        format.json { render :show, status: :ok, location: @acceptable_contact_position }
      else
        format.html { render :edit }
        format.json { render json: @acceptable_contact_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acceptable_contact_positions/1
  # DELETE /acceptable_contact_positions/1.json
  def destroy
    @acceptable_contact_position.destroy
    respond_to do |format|
      format.html { redirect_to acceptable_contact_positions_url, notice: 'Acceptable contact position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acceptable_contact_position
      @acceptable_contact_position = AcceptableContactPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acceptable_contact_position_params
      params.require(:acceptable_contact_position).permit(:position)
    end
end
