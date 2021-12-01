#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 5
#  30/11/2021

class AdminController < ApplicationController
    layout "applicationAdmin"

    before_action :authenticate_user!

    before_action :is_admin?  

    

    def home_page
        get_users
        get_all_recipes_group_by
    end

    def new
      @recette = Recette.new
      
    end
    def create
        @recette = Recette.new(recette_params)
        @recette.user = current_user

        if(@recette.save)
          redirect_to '/admin/recettes'

        else
          render :new
        end
    end

    def edit
      @recette = Recette.find(params[:id])
    end
  
    def update
      @recette = Recette.find(params[:id])
      if @recette.update(recette_params)
        redirect_to '/admin/recettes/' + @recette.id.to_s
      else
        render :edit
      end
    end
    
    def show
        get_recipe_by_id
    end 
    private
    def get_users
        @users = User.all
    end
    def get_recipe_by_id
      @recetteById = Recette.find(params[:id])
    end
    def get_all_recipes_group_by
      @recettes = Recette.all.group_by(&:user)
    end

    # Prendre note que 1 seul render peut être généré par requête
    def is_admin?
        
      unless current_user.is_admin?
        redirect_to "/"
      end
    end

    private
    def recette_params
        params[:recette].permit(:titre, :etapes)
    end
end