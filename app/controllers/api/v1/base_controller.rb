class Api::V1::BaseController < ActionController::Base
  respond_to :json
  
  def token_authentication
    if params[:ssid].present?
      user = User.find_by_authentication_token(params[:ssid])
      sign_in user if user
    else
      authenticate_api_v1_auth_user!
    end
  end
end
