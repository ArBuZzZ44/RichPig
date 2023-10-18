module Authorization
	extend ActiveSupport::Concern

	included do
		include Pundit

		rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

		private

		def user_not_authorized
			flash[:danger] = "You are not authorized for this action!"
			redirect_to(request.preferer || root_path)
		end
	end
end