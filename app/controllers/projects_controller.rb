class ProjectsController < ApplicationController
  def index
    @projects = Project.active_pledging
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save

    redirect_to @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

private
  def project_params
    params.require(:project).permit(:name, :description, :target_pledge_amount, :pledging_ends_on, :website, :image_file_name, :team_members)
  end
end
