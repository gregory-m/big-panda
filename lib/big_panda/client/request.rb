module BigPanda
  class Client
    module Request
      def post(path, options={})
        request(:post, path, options)
      end

      private

      def request(action, path, options)
        response = connection.send(action, path) do |request|
          request.body = options[:body] if options[:body]
          request.headers['authorization'] = "Bearer #{access_token}"
          request.headers['Accept'] = "application/json"
        end

        response.body
      end
    end
  end
end