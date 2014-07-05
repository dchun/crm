class DistrictImportsController < ApplicationController
  load_and_authorize_resource
  
  def new
  end

  def create
    fileimport = FileImport.new
    name = params[:district_import][:file].original_filename
    dir = "public/files/upload/#{Time.now.to_i}"
    Dir.mkdir(dir) unless File.exists?(dir)
    path = File.join(dir, name)
    File.open(path, "wb") { |f| f.write(params[:district_import][:file].read) }
    fileimport.file_name = name
    fileimport.file_path = path
    fileimport.save
    District.delay.import(fileimport.id)
    redirect_to districts_path, notice: "Districts Import added to queue. You can view the status #{view_context.link_to 'here', file_import_path(fileimport.id)} when finished."
  rescue
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file?"
    redirect_to(:action => 'new')
  end
end
