class ResumesController < ApplicationController
  def new
  end

  def create
    user = current_user
    user.resume = params[:resume][:file]
    user.save!
    redirect_to dashboard_path
  end
end
