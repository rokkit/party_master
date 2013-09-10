class Api::V1::Auth::SessionsController < Devise::SessionsController
  #include Devise::Controllers::InternalHelpers
  respond_to :json
  # POST
  # Generation users session
  # Find or create user by oauth token
  def create
    self.resource = User.where(username: params[:username]).first
    #set_flash_message(:notice, :signed_in) if is_navigational_format?
    #sign_in(resource_name, resource)
    if resource.nil?
      render json: nil, status: 401
    elsif resource.token = params[:token]
      sign_in(resource_name, resource)
      ssid = SecureRandom.urlsafe_base64(nil, false)
      render json: { user: resource, ssid: ssid }, status: :created
    end
  end
end
