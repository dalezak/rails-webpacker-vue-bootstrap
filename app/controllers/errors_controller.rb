class ErrorsController < ApplicationController

  def bad_request
    render(status: 400)
  end

  def unknown_error
    render(status: 400)
  end

  def route_not_found
    render(status: 404)
  end

  def resource_not_found
    render(status: 404)
  end

  def not_acceptable
    render(status: 406)
  end

  def not_authorized
    render(status: 422)
  end

  def internal_server_error
    render(status: 500)
  end

  def service_unavailable
    render(status: 500)
  end

end
