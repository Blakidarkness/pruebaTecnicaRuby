class ProjectsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @projects = Project.all
    end
    def new
        @categories = Category.all    
    end
    def create
        
        @project = Project.new
        @project.finishDate = params[:fecha]
        @project.name = params[:nombre]
        @project.description = params[:descripcion]
        @project.currentStatus = params[:status]
        @project.active = params[:activo]
        @project.category_id = params[:categoria]
        @project.save()
        redirect_to projects_path
    end
    def edit
        @categories = Category.all    
        @project = Project.find(params[:id])
    end
    def  actualizar
        @project = Project.find(params[:id])
        @project.update(finishDate:params[:fecha])
        @project.update(name:params[:nombre])
        @project.update(description:params[:descripcion])
        @project.update(currentStatus: params[:status])
        @project.update(active: params[:activo])
        @project.update(category_id: params[:categoria])
        @project.save()
        redirect_to projects_path
    end
    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
      end
end
