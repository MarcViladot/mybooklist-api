class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include ActionController::Helpers

  before_action :set_current_user
  helper_method :authenticate_confirmed_user, :authenticate_request

  def authenticate_confirmed_user
    unless @current_user.email_confirmed == 1
      render json: {error: 'Not Authorized'}, status: :unauthorized
    end
  end

  private

  # def authenticate_admin
  #   unless @current_user.role == 1
  #     render json: {error: 'Not Authorized'}, status: :unauthorized
  #   end
  # end

  def set_current_user
    if decoded_auth_token
      @current_user = User.find(decoded_auth_token[:user_id])
    end
  end

  def decoded_auth_token
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ').last
      JsonWebToken.decode(token)
    end
  end

  def authenticate_request
    unless @current_user
      render json: {error: 'Not Authorized'}, status: :unauthorized
    end
  end

end
