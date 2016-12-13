require 'rails_helper'

describe Api::V1::VideosController, type: :controller do
  context "#index" do
    let(:user) { create :user }
    let!(:videos) { create_list :video, 3, user: user }
    let(:token) { double acceptable?: true, resource_owner_id: user.id }

    before do
      allow(controller).to receive(:doorkeeper_token) { token }
      get :index
    end

    context "response size" do
      it { expect(JSON.parse(response.body).length).to eq 3 }
    end
    context "response 'status'" do
      it { expect(response.status).to eq 200 }
    end
  end
end
