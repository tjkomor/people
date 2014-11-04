class ResumesController < ApplicationController
  def new
  end

  def create
    person = current_person
    person.resume = params[:resume][:file]
    person.save!
    redirect_to dashboard_path
  end
end
