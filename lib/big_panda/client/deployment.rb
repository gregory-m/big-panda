module BigPanda
  class Client
    module Deployment

      # Public: Send start_deployment request
      #         Use this method to include deployments on your timeline.
      #
      # options - Deployment options
      #           Mandatory:
      #             options[:component] - Name of component
      #             options[:version] - Component version
      #           Optional:
      #             options[:timestamp] - UTC timestamp of the deployment event (default: UTC.Now)
      #             options[:description] - Free text description of the deployment
      #             options[:owner] - The person responsible for the deployment
      #             options[:env] -  Environment to which the component was deployed (e.g Prod, Staging, Dev, etc.)
      #             options[:source] - Deployment event source (e.g. Chef, Pupet, Capistrano, etc)
      #             options[:hosts] - Array of hosts to to which the component was deployed (e.g. ['a1.wix.com', 'a2.wix.com'])
      #
      # Examples:
      #
      #   start_deployment({ component: 'html-editor', version: '123' })
      #   # => {"status"=>"created", "id"=>"513363c091ad50246f00eec9"}
      #
      #   start_deployment({ component: 'html-editor', version: '123',
      #   timestamp: Time.now.to_i, description: 'Deploying new version',
      #   owner: 'Gregory Man', env: 'Production', source: 'chef',
      #   hosts: ['a1.wix.com', 'a2.wix.com'] })
      #   # => {"status"=>"created", "id"=>"51336b39b4a7ea843100cdb8"}
      #
      # Returns deployment status and ID
      def start_deployment(options)
        mandatory_options = [ :component, :version ]
        check_mandatory_options(options, mandatory_options)

        response = post(BigPanda::DEPLOYMENT_START_PATH, body: options)
        response['response']
      end

      # Public: Send finish_deployment request
      #         Call this method to declare the end of the deployment process.
      #         The end event is optional.
      #
      # options - Deployment options
      #           Mandatory:
      #             options[:component] - Name of component
      #             options[:version] - Component version
      #           Optional:
      #             options[:timestamp] - UTC timestamp of the deployment event (default: UTC.Now)
      #             options[:hosts] - Array of hosts to to which the component was deployed (e.g. ['a1.wix.com', 'a2.wix.com'])
      #
      # Examples:
      #
      #   finish_deployment({ component: 'html-editor', version: '123' })
      #   # => {"status"=>"created", "id"=>"51336fd391ad50246f00efb3"}
      #
      #   finish_deployment({ component: 'html-editor', version: '123',
      #   timestamp: Time.now.to_i, status: 'failure', errorMessage: 'Ooops',
      #   hosts: ['a1.wix.com', 'a2.wix.com']})
      #   # => {"status"=>"created", "id"=>"51336b39b4a7ea843100cdb8"}
      #
      # Returns status and ID
      def finish_deployment(options)
        mandatory_options = [ :component, :version ]
        check_mandatory_options(options, mandatory_options)

        response = post(BigPanda::DEPLOYMENT_END_PATH, body: options)
        response['response']
      end
    end
  end
end