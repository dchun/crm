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
  end
end
