class PasswordResetsController < ApplicationController
	before_action :require_no_authentication

	def create
		@user = User.find_by(email: params[:email])

		if @user.present?
			@user.set_password_reset_token

			PasswordResetMailer.with(user: @user).reset_email.deliver_later # отправит письмо в фоновом режиме, deliver_now отправит письмо сразу, но может долго грузить
		end

		flash[:success] = "password reset instructions have been sent to your email"
		redirect_to new_session_path
	end
end