Rails.application.routes.draw do
  resources :progresses
  resources :days
  resources :habits
  resources :users

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post "/user_info", to: 'progresses#user_info'

  # post '/current_month', to: 'users#current_month'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
