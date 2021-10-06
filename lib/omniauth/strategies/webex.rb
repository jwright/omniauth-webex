require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Webex < OmniAuth::Strategies::OAuth2
      option :name, "webex"
      option :client_options,
        site: "https://webexapis.com",
        authorize_path: "/v1/authorize"
    end
  end
end
