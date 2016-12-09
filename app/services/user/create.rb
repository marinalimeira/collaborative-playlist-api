class Services::User::Create
  attr_accessor :user

  def initialize params
    @params = params
  end

  def call
    @user = User.new(@params)

    if @user.valid?
      @user.save
      true
    else
      false
    end
  end
end
