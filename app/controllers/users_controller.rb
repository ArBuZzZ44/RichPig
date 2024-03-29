class UsersController < ApplicationController
	before_action :require_no_authentication, only: %i[new create]
	before_action :require_authentication, only: %i[edit update]
	before_action :set_user!, only: %i[edit update]
	before_action :authorize_user!
	after_action :verify_authorized

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		if @user.save
			sign_in(@user)
			flash[:success] = "Welcome to the app, #{current_user.name_or_email}!"
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @user.update user_params
			flash[:success] = "You profile was successfully updated!"
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def set_user!
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation, :avatar)
	end

	def authorize_user!
		authorize(@user || User)
	end
end