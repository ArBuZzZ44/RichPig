class ApplicationController < ActionController::Base
	around_action :switch_locale

	private

	def switch_locale(&action)
		locale = localee_from_url || i18n.default_locale
		i18n.with_locale(locale, &action)
	end

	def localee_from_url
		locale = params[:locale]

		return locale if i18n.available_locales.map(&:to_s).include?(locale)
	end

	def default_url_options
		{ locale: i18n.locale }
	end