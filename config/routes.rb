Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
  namespace :v1 do
    defaults format: :json do
      resources :courts, only: [:index, :show]
      resources :reservations
    end
  end
end
end
