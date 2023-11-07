Rails.application.routes.draw do

	class AdminConstraint
		def matches?(request)
			user_id = request.session[:user_id] || request.cookie_jar.encrypted[:user_id]

			User.find_by(id: user_id)&.admin_role?
		end
	end

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
			resources :users, only: %i[index create edit update destroy], constraints: AdminConstraint.new
		end
	end
end
