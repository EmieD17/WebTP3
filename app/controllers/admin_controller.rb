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



    def home_page
        get_users
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
end