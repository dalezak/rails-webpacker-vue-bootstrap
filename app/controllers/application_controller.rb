class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  respond_to :html, :json

  rescue_from Exception, with: :unknown_error if Rails.env.production?
  rescue_from StandardError, with: :unknown_error
  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from ActionController::UnknownFormat, with: :bad_request
  rescue_from ActionController::InvalidCrossOriginRequest, with: :bad_request
  rescue_from ActionController::InvalidAuthenticityToken, with: :bad_request
  rescue_from AbstractController::ActionNotFound, with: :route_not_found
  rescue_from ActionView::MissingTemplate, with: :bad_request
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found
  rescue_from ActiveRecord::RecordNotSaved, with: :not_acceptable
  rescue_from ActionController::RoutingError, with: :route_not_found
  rescue_from AbstractController::DoubleRenderError, with: :bad_request
  rescue_from CanCan::AccessDenied, with: :not_authorized

  def not_authorized(error)
    logger.error "not_authorized #{error}"
    respond_to do |format|
      format.html { render template: "errors/not_authorized", status: 401 }
      format.json { render json: { error: "Not Authorized", status: 401 }, status: 401 }
      format.all { render nothing: true, status: 401 }
    end
  end

  def resource_forbidden(error)
    logger.error "resource_forbidden #{error}"
    respond_to do |format|
      format.html { render template: "errors/not_authorized", status: 403 }
      format.json { render json: { error: "Forbidden", status: 403 }, status: 403 }
      format.all { render nothing: true, status: 403 }
    end
  end

  def resource_not_found(error)
    logger.error "resource_not_found #{error}"
    respond_to do |format|
      format.html { render template: "errors/resource_not_found", status: 404 }
      format.json { render json: { error: "Resource Not Found", status: 404 }, status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def route_not_found(error)
    logger.error "route_not_found #{error}"
    respond_to do |format|
      format.html { render template: "errors/route_not_found", status: 404 }
      format.json { render json: { error: "Route Not Found" }, status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def unsupported_version(error)
    logger.error "unsupported_version #{error}"
    respond_to do |format|
      format.html { render template: "errors/unsupported_version", status: 404 }
      format.json { render json: { error: "Unsupported Version", status: 404 }, status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def not_acceptable(error)
    logger.error "not_acceptable #{error}"
    logger.error error.backtrace.join("\n") unless error.backtrace.nil?
    respond_to do |format|
      format.html { render template: "errors/not_acceptable", status: 406 }
      format.json { render json: { error: "Not Acceptable", status: 406 }, status: 406 }
      format.all { render nothing: true, status: 406 }
    end
  end

  def bad_request(error)
    logger.error "bad_request #{error}"
    logger.error error.backtrace.join("\n") unless error.backtrace.nil?
    respond_to do |format|
      format.html { render template: "errors/bad_request", status: 400 }
      format.json { render json: { error: "Bad Request", status: 400 }, status: 400 }
      format.all { render nothing: true, status: 400 }
    end
  end

  def unknown_error(error)
    logger.error "unknown_error #{error}"
    logger.error error.backtrace.join("\n") unless error.backtrace.nil?
    respond_to do |format|
      format.html { render template: "errors/unknown_error", status: 500 }
      format.json { render json: { error: "Unknown Error", status: 500 }, status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end

  protected

  def set_current_user
    User.current = current_user
  end

  def current_token
    request.env["warden-jwt_auth.token"]
  end

end