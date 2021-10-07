require "spec_helper"

RSpec.describe OmniAuth::Strategies::Webex do
  let(:raw_info) do
    {
      "id" => "12345",
      "emails" => ["jimmy@zeppelin.com"],
      "nickName" => "jimmy",
      "displayName" => "Jimmy Page"
    }
  end

  subject(:strategy) do
    OmniAuth::Strategies::Webex.new("appid", "secret")
  end

  describe "#options" do
    it "has the correct name" do
      expect(strategy.options.name).to eq "webex"
    end

    describe "#authorize_options" do
      it "includes a scope option" do
        expect(strategy.options.authorize_options).to include :scope
      end
    end

    describe "#client_options" do
      it "has the correct site" do
        expect(strategy.options.client_options.site).to eq "https://webexapis.com"
      end

      it "has the correct authorize url" do
        expect(strategy.options.client_options.authorize_url).to eq "https://webexapis.com/v1/authorize"
      end

      it "has the correct token url" do
        expect(strategy.options.client_options.token_url).to eq "https://webexapis.com/v1/access_token"
      end
    end

    describe "#callback_url" do
      let(:env) { {} }
      let(:request) do
        double("Request",
               scheme: "https",
               url: "https://somewhere.com",
               script_name: "",
               query_string: "?foo=bar",
               env: env)
      end

      before do
        allow(strategy).to receive(:request).and_return(request)
        strategy.instance_variable_set(:@env, env)
      end

      it "does not contain additional parameters" do
        expect(strategy.callback_url).to eq "https://somewhere.com/auth/webex/callback"
      end
    end

    describe "#info" do
      before { allow(strategy).to receive(:raw_info).and_return raw_info }

      it "returns the raw info for the user" do
        expect(strategy.info).to eq raw_info
      end
    end

    describe "#uid" do
      before { allow(strategy).to receive(:raw_info).and_return raw_info }

      it "returns the id for the user" do
        expect(strategy.uid).to eq "12345"
      end
    end
  end
end
