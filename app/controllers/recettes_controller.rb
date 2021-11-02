class RecettesController < ApplicationController

    before_action :get_recipes, only: [:home_page]
    before_action :get_recipe_by_id, only: [:show]

    def home_page
        
    end

    def show

    end

    private
    def get_recipes
        @recettes = Recette.all.order(:titre)
    end

    def get_recipe_by_id
        @recetteById = Recette.find(params[:id])
    end



end