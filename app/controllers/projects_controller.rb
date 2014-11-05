class ProjectsController < ApplicationController
  def index
    @projects = current_person.projects
  end

  def new
    @project = current_person.projects.new
  end

  def create
    @project = current_person.projects.new
    Project.editable_attributes.each do |attr|
      @project.send("#{attr}=", params[:project][attr])
    end
    @project.save!
    redirect_to person_path(current_person)
  end

  def edit
    @project = current_person.projects.find(params[:id])
  end

  def update
    @project = current_person.projects.find(params[:id])
    Project.editable_attributes.each do |attr|
      @project.send("#{attr}=", params[:project][attr])
    end
    @project.save!
    redirect_to person_path(current_person)
  end

  def destroy
    current_person.projects.destroy(params[:id])
    redirect_to person_path(current_person)
  end
end
