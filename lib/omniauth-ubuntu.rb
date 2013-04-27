require 'omniauth/strategies/oauth'
require 'oauth/signature/plaintext'

module OmniAuth
  module Strategies
    class Ubuntu < OmniAuth::Strategies::OAuth
      # Give your strategy a name.
      option :name, "ubuntu"

      option :consumer_key, 'ubuntuone'
      option :consumer_secret, 'hammertime'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site               => 'https://one.ubuntu.com',
        :request_token_path => '/oauth/request',
        :authorize_path     => '/oauth/authorize',
        :access_token_path  => '/oauth/access',
        :scheme             => :query_string,
        :signature_method   => 'PLAINTEXT'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :name       => raw_info['name'],
          :email      => raw_info['email'],
          :nickname   => raw_info['nickname'],
          :first_name => raw_info['first_name'],
          :last_name  => raw_info['last_name']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/api/account/').body)
      end
    end
  end
end
