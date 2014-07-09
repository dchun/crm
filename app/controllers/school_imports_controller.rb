class SchoolImportsController < ApplicationController
  load_and_authorize_resource
  
  def new
  end

  def create
    fileimport = FileImport.new
    fileimport.file_name = params[:school_import][:file].original_filename
    fileimport.file_path = params[:school_import][:file]
    fileimport.save
    School.delay.import(fileimport.id)
    redirect_to schools_path, notice: "Schools Import added to #{view_context.link_to 'queue', delayed_job_path}. You can view the status #{view_context.link_to 'here', file_import_path(fileimport.id)} when finished."
  rescue
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file?"
    redirect_to(:action => 'new')
  end
end