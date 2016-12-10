class Services::SpaceStation::Create
  attr_accessor :space_station

  def initialize user, params
    @user   = user
    @params = params
  end

  def call
    @space_station = SpaceStation.new(user: @user, @params)

    if @space_station.valid?
      @space_station.save
      true
    else
      false
    end
  end
end
