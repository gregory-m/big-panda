require 'big_panda/client/connection'
require 'big_panda/client/request'
require 'big_panda/client/deployment'

module BigPanda
  class Client
    include BigPanda::Helper
    include Connection
    include Request
    include Deployment

    attr_reader :access_token, :target_url, :ssl

    def initialize(options={})
      @target_url = BigPanda::DEFAULT_TARGET_URL

      mandatory_options = [ :access_token ]
      check_mandatory_options(options, mandatory_options)
      @access_token = options[:access_token]
      @ssl = options[:ssl] ? options[:ssl] : {}
    end
  end
end