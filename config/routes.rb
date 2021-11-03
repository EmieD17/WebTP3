Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'recettes#home_page'
    
  get '/recettes/:id', to: 'recettes#show'

  get '/admin/recettes/:id', to: 'admin#show'

  get '/admin/recettes', to: 'admin#home_page'


end
