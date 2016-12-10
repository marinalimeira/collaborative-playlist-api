class Api::V1::ApplicationController < ActionController::API
  respond_to :json

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
