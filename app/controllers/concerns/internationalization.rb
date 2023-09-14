module Internationalization
	extend ActiveSupport::Concern

	included do 
		around_action :switch_locale

		private

		def switch_locale(&action)
			locale = localee_from_url || I18n.default_locale || locale_from_header
			I18n.with_locale(locale, &action)
		end

		def localee_from_url
			locale = params[:locale]

			return locale if I18n.available_locales.map(&:to_s).include?(locale)
		end

		def locale_from_header
			request.env['HTTP_ACCEPT_LANGUAGE'].scan(/[a-z]{2}/).first
		end

		def default_url_options
			{ locale: I18n.locale }
		end
	end
end