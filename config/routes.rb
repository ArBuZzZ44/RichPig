Rails.application.routes.draw do

  root 'pages#index'

  resources :capitals do 
    collection do 
      get 'completed'
    end
    resources :additions
  end

  resources :wallets do 
    resources :operations
  end

end
