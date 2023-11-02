class User < ApplicationRecord
	include Recoverable
	include Rememberable

	enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role

	attr_accessor :old_password, :admin_edit

	has_many :capitals, dependent: :destroy
	has_many :wallets, dependent: :destroy

	has_secure_password validations: false

	validate :correct_old_password, on: :update, if: -> {password.present? && !admin_edit}
	validate :password_presence
	validate :password_complexity
	validates :password, confirmation: true, allow_blank: true,
		length: {minimum: 8, maximum: 70}
	validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
	validates :role, presence: true

	def author?(obj)
		obj.user == self
	end

	def guest?
		false
	end

	# хешируем наш токен
	def digest(string)
		cost = ActiveModel::SecurePassword.
			min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	private

	def password_complexity
		return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

		msg = 'complexity requirement not met. Length should be 8-70 characters and ' \
          'include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    errors.add :password, msg
	end

	def password_presence
		errors.add(:password, :blank) unless password_digest.present?
	end

	def correct_old_password
		return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

		errors.add(:old_password, 'is incorrect')
	end
end
