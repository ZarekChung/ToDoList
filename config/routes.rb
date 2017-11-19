Rails.application.routes.draw do
  resources :todolists do 
    member do
      post :is_public
    end
    
  end
  root "todolists#index"
end
