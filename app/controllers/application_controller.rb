class ApplicationController < ActionController::API
  include ApiHandler
  include ExceptionHandler

  before_action :authorize_request

  private

  def authorize_request
    @current_user ||= authenticated
    render_error('Unauthorised', :unauthorised) && nil unless authenticated.present?
  end

  def authenticated
    request.headers['Authenticated']
  end
end
