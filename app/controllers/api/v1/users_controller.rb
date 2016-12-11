class Api::V1::UsersController < Api::V1::ApplicationController
  def create
    user_service = Services::User::Create.new create_params
    if user_service.call
      render json: user_service.user, status: :ok
    else
      render json: user_service.user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def create_params 
    params.permit :name, :email, :password, :password_confirmation
  end
end
