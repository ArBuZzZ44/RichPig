class PasswordResetMailer < ApplicationMailer
	def reset_email
		@user = params[:user]

		mail to: @user.email, subject: "Reset password | RichPig"
	end
end