require 'faraday_middleware'

module BigPanda
  class Client
    module Connection
      private

      def connection
        Faraday.new(url: target_url) do |faraday|
          faraday.use FaradayMiddleware::EncodeJson
          faraday.use FaradayMiddleware::ParseJson
          faraday.adapter  Faraday.default_adapter
        end
      end
    end
  end
end