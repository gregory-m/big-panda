require 'big_panda/client/connection'
require 'big_panda/client/request'
require 'big_panda/client/errors'
require 'big_panda/client/deployment'

module BigPanda

  # Public: API Client class, used to initialize API params like access_token
  class Client
    include BigPanda::Helper
    include Connection
    include Request
    include Deployment

    attr_reader :access_token, :target_url, :ssl

    # Public: Initialize API Client
    #         Use this method to set cliet params like access_token
    #
    # options - Client Options
    #           Mandatory:
    #             options[:access_token] - Access Token
    #           Optional:
    #             :ssl (All ssl options is same as in net/http)
    #             See http://ruby-doc.org/stdlib-1.9.3//libdoc/net/http/rdoc/Net/HTTP.html for details
    #               options[:ssl][:ca_file]
    #               options[:ssl][:ca_path]
    #               options[:client_cert]
    #               options[:client_key]
    #               options[:verify_depth]
    #               options[:version]
    #
    # Examples:
    #   BigPanda::Client.new(access_token: 'my-access-token')
    #   # => #<BigPanda::Client:0x007fe753892078 @target_url="https://api.bigpanda.io", @access_token="my-access-token", @ssl={}>
    #
    #   BigPanda::Client.new(access_token: 'my-access-token', ssl: {ca_file: '/my/cert.pem'})
    #   # => #<BigPanda::Client:0x007fe753050f68 @target_url="https://api.bigpanda.io", @access_token="my-access-token", @ssl={:ca_file=>"/my/cert.pem"}>
    #
    # Returns instance of BigPanda::Client
    def initialize(options={})
      @target_url = BigPanda::DEFAULT_TARGET_URL

      mandatory_options = [ :access_token ]
      check_mandatory_options(options, mandatory_options)
      @access_token = options[:access_token]
      @ssl = options[:ssl] ? options[:ssl] : {}
    end
  end
end