class RecettesController < ApplicationController

    before_action :get_recipes, only: [:home_page]
    before_action :get_recipe_by_id, only: [:show]

    def home_page
        
    end

    def show
        respond_to do |format|
            #format.html { render :html => @patient.to_s}
            #format.html { render 'patients/show'}
            format.html
            format.json { render :json => @recetteById.ingredients.to_json}
            format.xml { render :xml => @recetteById.ingredients.as_json}
         end
    end

    private
    def get_recipes
        @recettes = Recette.all.order(:titre)
    end

    def get_recipe_by_id
        @recetteById = Recette.find(params[:id])
    end



end