Rails.application.routes.draw do
  resources :customers
  resources :phone_calls
  root "phone_calls#index"
end
