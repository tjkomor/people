class ProjectsController < ApplicationController
  def index
    @projects = current_person.projects
  end

  def new
    @project = current_person.projects.new
  end

  def create
    @project = current_person.projects.create(project_params)

    if @project.save
      flash[:notice] = "Your project was created."
      redirect_to person_path(current_person)
    else
      flash.now[:error] = "Your project could not be created. Please try again."
      render :new
    end
  end

  def edit
    @project = current_person.projects.find(params[:id])
  end

  def update
    @project = current_person.projects.find(params[:id])

    if @project.update_attributes(project_params)
      flash[:notice] = "Your project was updated."
      redirect_to person_path(current_person)
    else
      flash.now[:error] = "Your project could not be updated. Please try again."
      render :edit
    end
  end

  def destroy
    project = current_person.projects.destroy(params[:id])

    flash[:notice] = "The project #{project.title} was deleted"
    redirect_to person_path(current_person)
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :my_focus,
      :github_url,
      :production_url,
      :travis_ci_badge_url,
      :code_climate_badge_url,
      :screenshot
      )
  end
end
