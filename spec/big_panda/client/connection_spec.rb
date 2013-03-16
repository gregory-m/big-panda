require "spec_helper"

describe BigPanda::Client::Connection do
  let(:access_token) { 'my-access-token' }

  context "With ssl options" do
    let(:options) { { access_token: access_token, ssl: ssl_options } }
    let(:ssl_options) { { ca_file: '/tmp/my.pem' } }

    subject { BigPanda::Client.new(options) }


    it "Pass SSL options to faraday" do
      conection = subject.send(:connection)
      conection.ssl.should eq(ssl_options)
    end

  end
end
