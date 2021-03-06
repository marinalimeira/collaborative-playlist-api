class Services::Video::Create
  attr_accessor :video

  def initialize user, params
    @user   = user
    @params = params
  end

  def call
    @video = ::Video.new user: @user, url: @params["url"]

    if @video.valid?
      @video.save
      true
    else
      false
    end
  end
end
