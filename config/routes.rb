Rails.application.routes.draw do
  resources :users
  resources :notes
  resources :customers

  root "pages#index"
  get "/settings", to: "pages#settings"
  get "/search", to: "pages#search"
end
