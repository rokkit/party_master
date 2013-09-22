class Api::V1::Auth::SessionsController < Devise::SessionsController
  #include Devise::Controllers::InternalHelpers
  respond_to :json
  skip_before_filter :verify_authenticity_token  
  before_action :ensure_required_params_exists
  # POST
  # Generation users session
  # Find or create user by oauth token
  def create
      self.resource = User.where(username: params[:username]).first
      #set_flash_message(:notice, :signed_in) if is_navigational_format?
      #sign_in(resource_name, resource)
      if resource.nil?
        self.resource = User.create! username: params[:username],
                                     token: params[:token], 
                                     email: "#{params[:username]}@#{params[:provider]}.com",
                                     password: "password", 
                                     password_confirmation: "password" if check_user_on_provider params[:username], params[:provider]
      end
        sign_in(resource_name, resource)
        resource.ensure_authentication_token!
        ssid = resource.authentication_token
        render json: { user: resource, ssid: ssid }, status: :created
  end
  
  private 
  def check_user_on_provider username, provider
    if true
      true
    else
      render json: nil, status: 401
    end
  end
  def ensure_required_params_exists
    begin
      params.require(:username)
    rescue ActionController::ParameterMissing
      render json: { error: "params not present" }, status: 401
      return
    end
  end
end
