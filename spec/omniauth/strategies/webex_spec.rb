require "spec_helper"

RSpec.describe OmniAuth::Strategies::Webex do
  subject(:strategy) do
    OmniAuth::Strategies::Webex.new("appid", "secret", @options || {})
  end

  describe "#options" do
    it "has the correct name" do
      expect(strategy.options.name).to eq "webex"
    end
  end
end
