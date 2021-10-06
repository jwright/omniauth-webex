require "spec_helper"

RSpec.describe OmniAuth::Strategies::Webex do
  subject(:strategy) do
    OmniAuth::Strategies::Webex.new("appid", "secret")
  end

  describe "#options" do
    it "has the correct name" do
      expect(strategy.options.name).to eq "webex"
    end

    describe "#client_options" do
      it "has the correct site" do
        expect(strategy.options.client_options.site).to eq "https://webexapis.com"
      end

      it "has the correct authorize path" do
        expect(strategy.options.client_options.authorize_path).to eq "/v1/authorize"
      end
    end
  end
end
