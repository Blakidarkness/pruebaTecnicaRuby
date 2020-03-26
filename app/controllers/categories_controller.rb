class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    def index
            @categories = Category.all
    end
    def new    
    end
    def create
        if params[:nombre].length>0
            @category = Category.new
            @category.name = params[:nombre]
            @category.description = params[:descripcion]
            @category.save()
            redirect_to categories_path 
        else
            flash[:alert] = 'Verifique todos los campos'
            redirect_back(fallback_location: root_path)
        end
        
        
    end
    def edit
        @category = Category.find(params[:id])
    end
    def  actualizar
        if params[:nombre].length>0
            @category = Category.find(params[:id])
            @category.update(name:params[:nombre])
            @category.update(description:params[:descripcion])
            redirect_to categories_path
        else
            flash[:alert] = 'Verifique todos los campos'
            redirect_back(fallback_location: root_path)
        end
       
        
    end
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
      end
end
