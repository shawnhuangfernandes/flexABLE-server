# Contains all the endpoints of the api (urls that produce json)

Rails.application.routes.draw do
  namespace :api do # namespace to organize all api resources under /api
    namespace :v1 do # namespace to organize all api resources under /api/v1
      resources :users # all user routes are /api/v1/users~
      resources :exercises # all exercise routes are /api/v1/exercises~
      resources :workouts # all workout routes are /api/v1/workouts~
      post '/login', to: 'auth#login' # specific route for authenticaticating a login
      get '/user_is_authed', to: 'auth#user_is_authed' # specific route for authorizing an active user
    end
  end
end
