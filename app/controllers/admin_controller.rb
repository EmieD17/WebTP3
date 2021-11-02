class AdminController < ApplicationController
    before_action :is_admin?
  
    private
    # Prendre note que 1 seul render peut être généré par requête
    def is_admin?
      unless params[:is_admin] && params[:is_admin] == "oui"
        render html: "NOT AUTORIZED"
      end
    end
  
  end