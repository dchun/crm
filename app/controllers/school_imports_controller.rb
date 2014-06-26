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
  rescue
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file?"
    redirect_to(:action => 'new')
  end
end
