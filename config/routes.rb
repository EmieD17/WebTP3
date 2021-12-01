#  Émie Doucet
#  Web: Serveur 2
#  Laboratoire 5
#  30/11/2021

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'recettes#home_page'
    
  get '/recettes/:id', to: 'recettes#show'

  get '/mesrecettes', to: 'recettes#mes_recettes'
  
  get '/mesrecettes/:id', to: 'recettes#mes_recettes_show'

  get '/admin/recettes/:id', to: 'admin#show'
  get '/admin/recettes', to: 'admin#home_page'

  get '/admin/recette/form', to: 'admin#new'
  post '/admin/recette/create', to: 'admin#create'

  get '/admin/recette/edit/:id', to: 'admin#edit'
  patch '/admin/recette/update/:id', to: 'admin#update'


end
