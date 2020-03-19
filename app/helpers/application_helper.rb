module ApplicationHelper
  
  def current_url
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

  def current_site
    ENV["APP_NAME"]
  end

  def current_title
    title = []
    title << current_site
    if content_for?(:title)
      title << content_for(:title)
    else
      title << params[:controller].split("/").last.titleize
    end
    title.uniq.join(" | ")
  end

  def sanitize(content)
    ActionController::Base.helpers.sanitize(content)
  end

  def strip_tags_and_entities(string)
    unless string.blank?
      stripped = strip_tags(string)
      decoded = HTMLEntities.new.decode(stripped)
      decoded.squish.gsub(%r{/<\/?[^>]*>/}, "")
    end
  end

  def route_exists?(path)
    begin
      recognize_path = Rails.application.routes.recognize_path(path, method: :get)
      recognize_path.present? && recognize_path[:action] != "route_not_found"
    rescue StandardError
      false
    end
  end

  def content_for_or(name, default)
    if content_for?(name)
      content_for(name)
    else
      default
    end
  end

  def body_class(params)
    body = []
    return unless params[:controller]
    if params[:controller].include?("/")
      body << params[:controller].split("/").first
      body << params[:controller].gsub("/", "-")
    else
      body << params[:controller]
    end
    if params[:controller].include?("/")
      body << "#{params[:controller].gsub("/", "-")}-#{params[:action]}"
    else
      body << "#{params[:controller]}-#{params[:action]}"
    end
    if params.key?(:page)
      body << "#{params[:controller]}-#{params[:action]}-#{params[:page]}"
    end
    body.join(" ")
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def current_token
    request.env["warden-jwt_auth.token"]
  end

  def link_to_with_icon(icon_css, title, url, options = {})
    icon = content_tag(:span, nil, class: icon_css)
    title_with_icon = icon << " ".html_safe << h(title)
    link_to(title_with_icon, url, options)
  end

  def link_to_new_window(name = nil, options = nil, html_options = {}, &block)
    if options.is_a?(Hash)
      options[:target] = "_blank"
      options[:rel] = "noopener nofollow noindex"
    end
    html_options[:target] = "_blank"
    html_options[:rel] = "noopener nofollow noindex"
    link_to(name, options, html_options, &block)
  end

  def pretty_number(number)
    number_to_human(number,
                    format: "%n%u",
                    units: { million: "M",
                             thousand: "K" })
  end

  def require_javascript(*javascript)
    @require_javascript ||= []
    @require_javascript |= javascript
  end

  def require_stylesheet(*stylesheet)
    @require_stylesheet ||= []
    @require_stylesheet |= stylesheet
  end

  def include_required_javascript
    javascript_include_tag(*@require_javascript, 'data-turbolinks-track': "reload")
  end

  def include_required_stylesheet
    stylesheet_link_tag(*@require_stylesheet, 'data-turbolinks-track': "reload")
  end

  def serialize(template, options = {})
    JbuilderTemplate.new(self) { |json| json.partial! template, options }.attributes!
  end
  
end
