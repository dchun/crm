class SchoolImportsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @file_import = FileImport.new
  end

  def create
    fileimport = FileImport.new
    name = params[:school_import][:file].original_filename
    dir = "public/files/upload/#{Time.now.to_i}"
    Dir.mkdir(dir) unless File.exists?(dir)
    path = File.join(dir, name)
    File.open(path, "wb") { |f| f.write(params[:school_import][:file].read) }
    fileimport.file_name = name
    fileimport.file_path = path
    fileimport.save
    School.delay.import(fileimport.id)
    redirect_to schools_path, notice: "Schools Import added to #{view_context.link_to 'queue', delayed_job_path}. You can view the status #{view_context.link_to 'here', file_import_path(fileimport.id)} when finished."
  rescue
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file?"
    redirect_to(:action => 'new')
  end
end