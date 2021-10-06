require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Webex < OmniAuth::Strategies::OAuth2
      option :name, "webex"
    end
  end
end
