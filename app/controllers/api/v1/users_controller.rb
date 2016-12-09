class Api::V1::UsersController < Api::V1::ApplicationController
  def create
    user_service = Services::User::Create.new create_params

    if user_service.call
      render json: user_service.user.to_json, status: :ok
    else
      render json: user_service.user.errors.to_json, status: :unprocessed_entity
    end
  end

  private

  def create_params 
    params.permit :name, :email, :password, :password_confirmation
  end
end
