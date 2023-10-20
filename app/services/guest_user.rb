class GuestUser
	def guest?
		true
	end

	def author?(_)
		false
	end

	def method_missing(method, *args, &block)
		return false if method.to_s.end_with?('_role?')

		super(method, *args, &block)
	end

	def respond_to_missing?(method, include_private)
		return true if method.to_s.end_with?('_role?')

		super(method, include_private)
	end
end