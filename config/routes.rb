Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :users do
        get :me
      end

      resources :space_stations
    end
  end
end
