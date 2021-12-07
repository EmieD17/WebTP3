#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 5
#  30/11/2021

class RecettesController < ApplicationController
    layout "application"
    before_action :authenticate_user!, only: [:mes_recettes]

    RECIPES_PER_PAGE = 8

    def home_page
        @page = params.fetch(:page, 0).to_i
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
        @recettes = Recette.offset(@page * RECIPES_PER_PAGE).limit(RECIPES_PER_PAGE).order(:titre)
    end

    def get_recipe_by_id
        @recetteById = Recette.find(params[:id])
    end

    def get_recipes_of_current_user
        @recettes = Recette.where(user: current_user)
    end
end