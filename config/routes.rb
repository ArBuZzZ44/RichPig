Rails.application.routes.draw do

  resources :capitals do 
    resources :additions
  end

  resources :finances

  root 'pages#index'
end
