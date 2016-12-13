class Api::V1::VideoController < Api::V1::ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_videos, only: [:index]

  def index
    render json: @videos, status: :ok
  end

  def create
    service = Services::Video::Create.new current_user, video_params
  
    if service.call
      render json: "criado yay", status: :ok
    else
      render json: service.video.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def video_params
    params.permit :url
  end

  def set_videos
    @videos = Video.all
  end
end
