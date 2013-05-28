require 'restclient'

module Wombat
  module Clients
    class Rest < Base

      def initialize(metadata = {})
        @agent = ::RestClient::Request
        super(metadata)
      end

      def page
        @agent.execute(method: http_method, url: url, headers: http_headers)
      end
    end
  end
end
