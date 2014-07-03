class SchoolImportsController < ApplicationController
  load_and_authorize_resource
  
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
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file? Did you make sure all headers conform to the list below?"
    redirect_to(:action => 'new')
  end
end
