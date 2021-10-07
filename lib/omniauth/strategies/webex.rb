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

      uid { raw_info["id"] }

      info do
        raw_info
      end

      extra do
        hash = {}
        hash["raw_info"] = raw_info unless skip_info?
        hash
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get("v1/people/me").parsed || {}
      end
    end
  end
end
