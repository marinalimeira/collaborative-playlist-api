require 'spec_helper'

describe Services::User::Create do
  let(:service) { Services::User::Create.new params }

  before { service.call }

  context "with valid params" do
    let(:params) do
      {
        name: "Chewbacca",
        email: "chewie@wookiee.com",
        password: "milleniumfalcon",
        password_confirmation: "milleniumfalcon"
      }
    end

    context "saves user at database and set its name" do
      it { expect(User.last.name).to be_eql "Chewbacca" }
    end

    context "set service user email" do
      it { expect(service.user.email).to be_eql "chewie@wookiee.com" }
    end
  end

  context "with invalid params" do
    let(:params) do
      {
        name: "",
        email: "chewie.com",
        password: "falcon",
        password_confirmation: "millenium"
      }
    end

    context "doesn't save User" do
      it { expect(User.last).to be_nil }
    end

    context "returns error messages" do
      let(:error_messages) { service.user.errors.full_messages }

      it { expect(error_messages).to include "E-mail não é válido" }
      it { expect(error_messages).to include "Nome não pode ficar em branco" }
      it { expect(error_messages).to include "Confirmação de senha não é igual a Senha" }
    end
  end
end
