class PeopleController < ApplicationController
  def index
    @locations = Location.visible
    @people = Person.active.order(:last_name)
  end

  def show
    @person = Person.find_by_slug(params[:id])
  end

  before_action :require_login, :only => [:edit, :update, :create, :new]

  def edit
    @person = current_person
  end

  def update
    @person = current_person
    Person.editable_attributes.each do |attr|
      @person.send("#{attr}=", params[:person][attr])
    end
    @person.save!
    redirect_to person_path(@person)
  end

  def create
    @person = Person.find_or_create_by(:user_github_id => current_user.github_id)
    Person.editable_attributes.each do |attr|
      @person.send("#{attr}=", params[:person][attr])
    end
    @person.save!
    redirect_to person_path(@person)
  end

  def new
    @person = Person.new
  end
end
