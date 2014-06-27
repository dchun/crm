class DistrictImportsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @district_import = DistrictImport.new
  end

  def create
    @district_import = DistrictImport.new(params[:district_import])
    if @district_import.save
      redirect_to root_url, notice: "Imported districts."
    else
      render :new
    end 
  rescue
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file?"
    redirect_to(:action => 'new')
  end
end
