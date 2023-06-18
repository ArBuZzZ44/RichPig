Rails.application.routes.draw do

  root 'pages#index'

  resources :capitals do 
    resources :additions
  end

  resources :finances

end
