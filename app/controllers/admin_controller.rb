#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 3
#  03/11/2021

class AdminController < ApplicationController
    layout "application"

    before_action :authenticate_user!

    before_action :is_admin?  

    

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

    # Prendre note que 1 seul render peut être généré par requête
    def is_admin?
        
      unless current_user.is_admin?
        redirect_to "/"
      end
    end
end