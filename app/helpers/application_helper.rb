module ApplicationHelper
	include Pagy::Frontend

	def pagination(obj)
		raw(pagy_bootstrap_nav(obj)) if @pagy.pages > 1
	end

	def full_title(page_title = "")
		base_title = "RichPig"
		page_title.present? ? "#{page_title} | #{base_title}" : base_title
	end

	def nav_tab(title, url, options = {})
		current_page = options.delete(:current_page)

		css_class = current_page == title ? 'text-secondary' : 'text-white'

		if options[:class].present?
			options[:class] = options[:class] + ' ' + css_class
		else
			options[:class] = css_class
		end

		link_to title, url, options
	end

	def currently_at(current_page = "")
		render partial: 'shared/menu', locals: {current_page: current_page}
	end
end
