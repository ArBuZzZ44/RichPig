class PasswordResetsController < ApplicationController
	before_action :require_no_authentication

	def create
		PasswordResetMailer.with(user: @user).reset_email.deliver_later # отправит письмо в фоновом режиме, deliver_now отправит письмо сразу, но может долго грузить
		
	end
end