class SchoolImportsController < ApplicationController
  def new
    @school_import = SchoolImport.new
  end

  def create
    @school_import = SchoolImport.new(params[:school_import])
    if @school_import.save
      redirect_to root_url, notice: "Imported schools."
    else
      render :new
    end 
  end
end
