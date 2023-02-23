Rails.application.routes.draw do
  resources :users
  resources :notes
  resources :customers

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/sessions#new"
  end

  # root "pages#index"
  get "/settings", to: "pages#settings"
  get "/search", to: "pages#search"
end
