class ProjectsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @projects = Project.all
    end
    def new    
    end
    def create
        @category = Project.new
        @category.name = params[:nombre]
        @category.description = params[:descripcion]
        @category.save()
        redirect_to categories_path
    end
    def edit
        @category = Project.find(params[:id])
    end
    def  actualizar
        @category = Project.find(params[:id])
        @category.update(name:params[:nombre])
        @category.update(description:params[:descripcion])
        redirect_to categories_path
    end
    def destroy
        @category = Project.find(params[:id])
        @category.destroy
        redirect_to categories_path
      end
end
