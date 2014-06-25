class DistrictImportsController < ApplicationController
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
  end
end
