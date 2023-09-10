Rails.application.routes.draw do

	scope '(:locale)', locale: /#{i18n.available_locales.join('|')}/ do
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
end
