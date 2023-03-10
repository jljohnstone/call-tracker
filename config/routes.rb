Rails.application.routes.draw do
  get '/notes', to: redirect("/")
  resources :users
  resources :notes
  resources :customers

  get '/autocomplete', to: 'customers#autocomplete'

  constraints Clearance::Constraints::SignedOut.new do
    root to: "clearance/sessions#new", as: :signed_out_root
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "notes#index", as: :signed_in_root
  end

  get "/settings", to: "pages#settings"
  get "/search", to: "search#index"
  root "pages#index"
end
