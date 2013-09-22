require 'spec_helper'

describe "UsersAuthentications", api: true do
  describe "creating user when athorization request come" do
    let(:token) { "token" }
    let(:username) { "maks_ohs" }
    let(:data) { JSON.parse(last_response.body) }
    let!(:user) { FactoryGirl.create :user }

    before(:each) do
      post api_v1_auth_user_session_path(format: :json), token: token, username: username, provider: 'vk'
    end

    context "when user with given credentials not exist" do
      
      context "user valid on provider" do
        let(:username) { "vasya" }
        it { last_response.status.should eq(201) }
        it "return ssid" do
          data['ssid'].should_not be_nil
        end
      end
      context "user not valid on provider" do
        let(:username) { "not_exist" }
        it "should return 401"
      end
    end

    context "user with username exist but token expired but valid on provider" do
      it "should respond with user object"
      it "should respond with ssid"
    end

    context "user with user expired but token invalid" do
      it "should return status 401"
    end

    context "user exist with valid username and token" do
      it { last_response.status.should eq(201) }
      it "return ssid" do
        data['ssid'].should_not be_nil
      end
      it "should return user object" do
        data['user']['id'].should eq user.id
      end
    end
  end
end
