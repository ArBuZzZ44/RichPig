Rails.application.routes.draw do

  resoures :capitals

  resources :finances

  root 'pages#index'
end
