Rails.application.routes.draw do
  root to: 'goals#index'
  
  get '/goals', to: 'goals#index'
  post '/goals', to: 'goals#create'
  put '/goals/:id', to: 'goals#update'
  put '/goals', to: 'goals#update_position'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
