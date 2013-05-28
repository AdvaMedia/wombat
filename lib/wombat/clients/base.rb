module Wombat
  module Clients
    class Base
      attr_reader :options, :url, :agent

      def initialize(metadata)
        @options = metadata.delete(:request) || {}
        @url = "#{metadata[:base_url]}#{metadata[:path]}"
      end

      def page
      end

      protected

      def http_method
        @options.fetch(:http_method, :get)
      end

      def http_headers
        @options.fetch(:http_headers, {})
      end

      def http_parameters
        @options.fetch(:http_parameters, [])
      end

      def get
      end

      def post
      end
    end
  end
end
