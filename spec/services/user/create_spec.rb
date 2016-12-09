require 'spec_helper'

describe Services::User::Create do
  describe "Create new User" do
    let(:params) do
      {
        name: "Chewbacca",
        email: "chewie@wookiee.com",
        password: "milleniumfalcon",
        password_confirmation: "milleniumfalcon"
      }
    end
    
    let(:service) { Services::User::Create.new params }

    before { service.call }

    it { expect(User.last.name).to be_eql "Chewbacca" }
    
    it { expect(service.user.email).to be_eql "chewie@wookiee.com" }
  end
end
