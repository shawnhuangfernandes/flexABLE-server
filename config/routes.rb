# Contains all the endpoints of the api (urls that produce json)

Rails.application.routes.draw do
  namespace :api do # namespace to organize all api resources under /api
    namespace :v1 do # namespace to organize all api resources under /api/v1
      resources :users do
        resources :workouts
      end
      resources :exercises # all exercise routes are /api/v1/exercises~
      post '/login', to: 'auth#login' # specific route for authenticaticating a login
      get '/user_is_authed', to: 'auth#user_is_authed' # specific route for authorizing an active user
    end
  end
end
