class PeopleController < ApplicationController
  def index
    @locations = Location.visible
    @people = Person.active.order(:last_name)
  end

  def show
    @person = Person.find_by_slug(params[:id])
  end

  before_action :require_login, only: [:new, :create, :edit, :update]

  def new
    @person = Person.new
  end

  def create
    @person = Person.find_or_create_by(user_github_id: current_user.github_id)

    if @person.update_attributes(person_params)
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def edit
    @person = current_person
  end

  def update
    @person = current_person

    if @person.update_attributes(person_params)
      redirect_to person_path(@person)
    else
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
