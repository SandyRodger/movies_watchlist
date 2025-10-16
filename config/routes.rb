Rails.application.routes.draw do
  # Health check route (fine to keep)
  get "up" => "rails/health#show", as: :rails_health_check

  # Main resource
  resources :movies

  # Optional: set the homepage
  root "movies#index"

end
