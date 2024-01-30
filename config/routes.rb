Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'authentication#login', default: {format: :json}
    end
  end
  root "application#root", default: {format: :json}
  post '/login', to: 'authentication#login'
end
