Rails.application.routes.draw do

	scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
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

		resources :users, only: %i[new create edit update]
		
		resource :session, only: %i[new create destroy]

		resource :password_reset, only: %i[new create edit update]

		namespace :admin do 
			resources :users, only: %i[index create edit update destroy]
		end
	end
end
