class FileImportsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @file_imports = FileImport.all
  end

  def show
    @file_import = FileImport.find(params[:id])
  end

  def destroy
    @file_import = FileImport.find(params[:id])
    @file_import.destroy
    respond_to do |format|
      format.html { redirect_to file_imports_url, notice: 'File Import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
