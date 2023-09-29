class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			sign_in(user)
			flash[:success] = "Welcome back, #{current_user.name_or_email}"
			redirect_to root_path
		else
			flash.now[:warning] = "Incorrect email and/or password"
			render :new
		end
	end

	def destroy
		sign_out
		flash[:success] = "See your later!"
		redirect_to root_path
	end
end