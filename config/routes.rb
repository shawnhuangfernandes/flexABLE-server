Rails.application.routes.draw do

  resources :workouts
  namespace :api do
    namespace :v1 do
      resources :users
      resources :exercises
      resources :workouts
      post '/login', to: 'auth#login'
      get '/user_is_authed', to: 'auth#user_is_authed'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
