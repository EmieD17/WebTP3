#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 3
#  03/11/2021

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
        
    end 
    private
    def get_users
        @users = User.all
    end
    def get_recipe_by_id
      @recetteById = Recette.find(params[:id])
  end
end