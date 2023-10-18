class ApplicationController < ActionController::Base
	include Authorization
	include Internationalization
	include Pagy::Backend
	include Authentication
end