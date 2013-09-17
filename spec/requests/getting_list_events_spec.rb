require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "list events" do
  let(:user) { FactoryGirl.create :user }
  describe "user request with invalid session" do
    describe "when ssid not present" do
      before do
        get api_v1_events_path format: :json
      end
      subject { response }
      it { status.should eq 401 }
    end
  end
  describe "user with valid session" do
    describe "when ssid present" do
      before do
        get api_v1_events_path format: :json, ssid: "ssid"
      end
      subject { response }
      it { status.should eq 200 }
    end
  end
end