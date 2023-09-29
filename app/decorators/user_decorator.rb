class UserDecorator < ApplicationDecorator
  delegate_all

	def name_or_email
		name.present? ? name : email.split('@').first
	end
end
