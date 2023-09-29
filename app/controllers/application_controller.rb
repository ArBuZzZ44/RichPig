class ApplicationController < ActionController::Base
	include Internationalization
	include Pagy::Backend
	include Authentication
end