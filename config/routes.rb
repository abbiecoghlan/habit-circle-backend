Rails.application.routes.draw do
  resources :progresses
  resources :days
  resources :habits
  resources :users

  post '/login', to: 'auth#create'
  get '/profile', to: 'auth#profile'
  post "/user_info", to: 'progresses#user_info'
  post "/create_month", to: 'habits#create_month'
  post "/delete_by_habit", to: "progresses#delete_by_habit"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
