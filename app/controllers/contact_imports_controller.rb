class ContactImportsController < ApplicationController
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
    flash[:error] = "Something seems to be wrong. Did you forget to upload a file?"
    redirect_to(:action => 'new')
  end
end
