class ApplicationController < ActionController::API
  #protect_from_forgery with: :exception
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized
  
  private
  
  def current_user
    @current_user ||= User.find(payload['user_id']) #Payload term comes from JWT Sessions
  end

  def not_authorized
    render json: { error: "Not authorized" }, status: :unauthorized
  end
end
