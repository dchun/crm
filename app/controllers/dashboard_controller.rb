class DashboardController < ApplicationController
  def index
    if params[:geo].present?
      @locations = School.near(params[:geo], params[:distance], :order => :distance)
    else
      @locations = School.all
    end
  end
end
