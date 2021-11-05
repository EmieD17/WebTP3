#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 3
#  03/11/2021

class RecettesController < ApplicationController

    def home_page
        get_recipes
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
end