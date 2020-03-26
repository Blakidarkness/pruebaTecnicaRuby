class ProjectsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    def index
        @projects = Project.all
        @categories = Category.all
    end
    def new
        @categories = Category.all    
    end
    def create
        if (params[:fecha].length>0 && params[:nombre].length>0 && params[:categoria].length>0)
        @project = Project.new
        @project.finishDate = params[:fecha]
        @project.name = params[:nombre]
        @project.description = params[:descripcion]
        @project.currentStatus = params[:status]
        @project.active = params[:activo]
        @project.category_id = params[:categoria]
        @project.save()
        redirect_to projects_path
        else
            flash[:alert] = 'Verifique todos los campos'
            redirect_back(fallback_location: root_path)
        end
        
    end
    def edit
        @categories = Category.all    
        @project = Project.find(params[:id])
    end
    def  actualizar
        if (params[:fecha].length>0 && params[:nombre].length>0 && params[:categoria].length>0)
        @project = Project.find(params[:id])
        @project.update(finishDate:params[:fecha])
        @project.update(name:params[:nombre])
        @project.update(description:params[:descripcion])
        @project.update(currentStatus: params[:status])
        @project.update(active: params[:activo])
        @project.update(category_id: params[:categoria])
        @project.save()
        redirect_to projects_path
        else
            flash[:alert] = 'Verifique todos los campos'
            redirect_back(fallback_location: root_path)
        end
    end
    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end
    def buscar
        if params[:categoria].to_i == 0
            @projects = Project.all
            @categories = Category.all
            render "result" 
        else
            @categories = Category.all 
            @projects = Project.where(category_id: params[:categoria])
            render "result"
        end
    end
end
