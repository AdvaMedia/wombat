require 'mechanize'

module Wombat
  module Clients
    class Html < Base
      attr_reader :agent, :options, :url

      def initialize(agent, metadata = {})
        @agent = agent
        super(metadata)
      end

      def page
        case http_method
        when :get
          agent.get(url)
        when :post
          agent.post(url)
        end
      end
    end
  end
end
