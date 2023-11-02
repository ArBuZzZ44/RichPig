module Recoverable
	extend ActiveSupport::Concern

	included do
		# такая же функция обратного вызова, как и before_action
		# т.к. в базе есть password_digest, то rails может проверить, изменялся ли он
		before_update :clear_password_reset_token, if: :password_digest_changed?

    def set_password_reset_token
			update password_reset_token: digest(SecureRandom.urlsafe_base64),
					   password_reset_token_sent_at: Time.current
    end

		def clear_password_reset_token # очищаем токен после сброса пароля
			self.password_reset_token = nil
			self.password_reset_token_sent_at = nil
		end

		def password_reset_period_valid?
			password_reset_token_sent_at.present? && (Time.current - password_reset_token_sent_at) <= 60.minutes
		end
  end
end