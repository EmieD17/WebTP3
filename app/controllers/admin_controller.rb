class AdminController < ApplicationController
    #before_action :is_admin?
  
    #private
    # Prendre note que 1 seul render peut être généré par requête
    #def is_admin?
    #  unless params[:is_admin] && params[:is_admin] == "oui"
    #    render html: "NOT AUTORIZED"
    #  end
    #end

    before_action :get_users, only: [:home_page]
    before_action :get_recipe_by_id, only: [:show]

    def home_page
        
    end

    def show
        respond_to do |format|
            format.html
            format.json { render :json => @recetteById.ingredients.to_json}
            format.xml { render :xml => @recetteById.ingredients.as_json}
        end
    end 
    private
    def get_users
        @users = User.all
    end
    def get_recipe_by_id
      @recetteById = Recette.find(params[:id])
  end
end