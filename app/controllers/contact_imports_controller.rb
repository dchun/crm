class ContactImportsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @contact_import = ContactImport.new
  end

  def create
    @contact_import = ContactImport.new(params[:contact_import])
    if @contact_import.save
      redirect_to contacts_url, notice: "Imported contacts."
    else
      render :new
    end
  rescue
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file? Also, if ID column is present make sure all fields are filled in. Perhaps you forgot to fill in all school fields?"
    redirect_to(:action => 'new')
  end
end
