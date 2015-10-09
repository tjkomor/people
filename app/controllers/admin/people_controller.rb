class Admin::PeopleController < ApplicationController
  before_action :require_admin

  def index
    @people = Person.by_cohort
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(person_params)
      flash[:notice] = "The person was updated."
      redirect_to admin_people_path
    else
      flash.now[:error] = "The person could not be updated."
      render :edit
    end
  end

  private

  def person_params
    params.require(:person).permit(
      :first_name,
      :last_name,
      :email_address,
      :github_url,
      :looking_for,
      :best_at,
      :cohort_id,
      :photo_slug,
      :hidden,
      :introduction,
      :hired,
      :hired_by
      )
  end
end
