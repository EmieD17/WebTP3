#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 3
#  03/11/2021

class RecettesController < ApplicationController
    before_action :authenticate_user!, only: [:mes_recettes]

    def home_page
        get_recipes
    end

    def mes_recettes
        get_recipes_of_current_user
    end

    def mes_recettes_show
        get_recipe_by_id

        unless (@recetteById.user == current_user)
            redirect_to "/mesrecettes"
        end
    end

    
    def show
        get_recipe_by_id
    end

    private
    def get_recipes
        @recettes = Recette.all.order(:titre)
    end

    def get_recipe_by_id
        @recetteById = Recette.find(params[:id])
    end

    def get_recipes_of_current_user
        @recettes = Recette.where(user: current_user)
    end
end