Rails.application.routes.draw do
  resources :todolists
  root "todolists#index"
end
