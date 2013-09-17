class Api::V1::EventsController < Api::V1::BaseController
  before_action :token_authentication
  respond_to :json
  
  def index
    render json: { events:[] }
  end
end