require 'rails_helper'

describe Api::V1::UsersController, type: :controller do
  describe "#create" do
    let(:params) do
      { 
        name: "Leia Skywalker",
        email: "leia@rebelalliance.com", 
        password: "hansolo",
        password_confirmation: "hansolo"
      }
    end

    let(:user) { build :user, params }

    before do
      allow_any_instance_of(Services::User::Create).to receive(:call).and_return true
      allow_any_instance_of(Services::User::Create).to receive(:user).and_return user
      post :create, params: params
    end

    context "response 'name'" do
      it { expect(JSON.parse(response.body)["name"]).to be_eql "Leia Skywalker" }
    end

    context "response 'email'" do
      it { expect(JSON.parse(response.body)["email"]).to  be_eql "leia@rebelalliance.com" }
    end

    context "response 'status'" do
      it { expect(response.status).to eq 200 }
    end
  end
end
