class ProjectsController < ApplicationController
  before_action :current_project, only: [:show, :edit, :update, :destroy]

  def index
  	@projects = Project.all
  end

  def show
  end

  def new
  	@project = Project.new
  end

  def create 
    @project = Project.new(project_params)
    if @project.save
    	redirect_to @project
    else
      render :new
    end  	
  end	

  def edit
  end

  def update
    @project.update_attributes(project_params)
    if @project.errors.empty?
    	redirect_to @project
    else
      render :edit
    end  	
  end	

  def destroy
    @project.delete
    redirect_to projects_path
  end	

  private

  def project_params
    params.require(:project).permit(:name, :price)
  end	

  def current_project
    @project = Project.where(id: params[:id]).first
  end	
end