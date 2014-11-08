class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    project_params = params.require(:project).permit(:name, :description, :target_pledge_amount, :pledging_ends_on, :website)
    @project.update(project_params)
    redirect_to @project
  end
end
