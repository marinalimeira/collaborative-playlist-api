Rails.application.routes.draw do
  use_doorkeeper
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  devise_for :users
end
