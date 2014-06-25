class AcceptableContactRolesController < ApplicationController
  before_action :set_acceptable_contact_role, only: [:show, :edit, :update, :destroy]

  # GET /acceptable_contact_roles
  # GET /acceptable_contact_roles.json
  def index
    @acceptable_contact_roles = AcceptableContactRole.all
  end

  # GET /acceptable_contact_roles/1
  # GET /acceptable_contact_roles/1.json
  def show
  end

  # GET /acceptable_contact_roles/new
  def new
    @acceptable_contact_role = AcceptableContactRole.new
  end

  # GET /acceptable_contact_roles/1/edit
  def edit
  end

  # POST /acceptable_contact_roles
  # POST /acceptable_contact_roles.json
  def create
    @acceptable_contact_role = AcceptableContactRole.new(acceptable_contact_role_params)

    respond_to do |format|
      if @acceptable_contact_role.save
        format.html { redirect_to @acceptable_contact_role, notice: 'Acceptable contact role was successfully created.' }
        format.json { render :show, status: :created, location: @acceptable_contact_role }
      else
        format.html { render :new }
        format.json { render json: @acceptable_contact_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acceptable_contact_roles/1
  # PATCH/PUT /acceptable_contact_roles/1.json
  def update
    respond_to do |format|
      if @acceptable_contact_role.update(acceptable_contact_role_params)
        format.html { redirect_to @acceptable_contact_role, notice: 'Acceptable contact role was successfully updated.' }
        format.json { render :show, status: :ok, location: @acceptable_contact_role }
      else
        format.html { render :edit }
        format.json { render json: @acceptable_contact_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acceptable_contact_roles/1
  # DELETE /acceptable_contact_roles/1.json
  def destroy
    @acceptable_contact_role.destroy
    respond_to do |format|
      format.html { redirect_to acceptable_contact_roles_url, notice: 'Acceptable contact role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acceptable_contact_role
      @acceptable_contact_role = AcceptableContactRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acceptable_contact_role_params
      params.require(:acceptable_contact_role).permit(:role)
    end
end
