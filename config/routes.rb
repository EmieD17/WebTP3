Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'recettes#home_page'
    
  get '/recettes/:id', to: 'recettes#show'

  get '/admin/:is_admin', to: 'admin#is_admin?'

  get '/admin/recettes', to: 'admin#show'


end
