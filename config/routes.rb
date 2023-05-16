Rails.application.routes.draw do

  resources :capitals

  resources :finances

  root 'pages#index'
end
