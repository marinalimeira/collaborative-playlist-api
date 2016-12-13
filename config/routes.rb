Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      resource :users, only: [:create] do
        get :me
      end

      resources :videos, only: [:create, :index]
    end
  end
end
