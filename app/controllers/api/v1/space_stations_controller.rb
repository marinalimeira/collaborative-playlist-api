class Api::V1::SpaceStationsController < Api::V1::ApplicationController
  before_action :doorkeeper_authorize!
  before_action :set_space_stations, only: [:index]

  def index
    render json: @space_stations, status: :ok
  end

  def create
    service = Services::SpaceStation::Create.new(current_user, space_station_params)
  
    if service.call
      render json: "criado yay", status: ok
    else
      render json: service.space_station.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def space_station_params
    params.permit :name
  end

  def set_space_stations
    @space_stations = SpaceStation.where user: current_user
  end
end
