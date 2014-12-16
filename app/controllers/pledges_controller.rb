class PledgesController < ApplicationController
  before_action :set_project, only: [:index, :new, :create]

  def index
    @pledges = @project.pledges
  end

  def new
    @pledge = @project.pledges.new
  end

  def create
    @pledge = @project.pledges.new(pledge_params)
    if @pledge.save
      redirect_to project_pledges_path(@project), notice: "Thanks for your pledge, we appreciate it."
    else
      render :new
    end
  end

private
  def pledge_params
    params.require(:pledge).permit(:name, :email, :comment, :amount)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
