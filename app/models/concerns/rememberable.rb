module Rememberable
	extend ActiveSupport::Concern

	included do
    attr_accessor :remember_token

		def remember_me
			self.remember_token = SecureRandom.urlsafe_base64
			update_column :remember_token_digest, digest(remember_token)
		end
	
		# забываем пользователя
		def forget_me
			update_column :remember_token_digest, nil
			self.remember_token = nil
		end
	
		# Сравниваем хешированный токен из бд и токен, который получаем от юзера
		def remember_token_authenticated?(remember_token)
			return false unless remember_token_digest.present?
	
			BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
		end
  end
end