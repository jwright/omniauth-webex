require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Webex < OmniAuth::Strategies::OAuth2
      option :name, "webex"

      option :authorize_options, [:scope]

      option :client_options,
        site: "https://webexapis.com",
        authorize_url: "https://webexapis.com/v1/authorize",
        token_url: "https://webexapis.com/v1/access_token"

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
