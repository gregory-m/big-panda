require "spec_helper"

describe BigPanda::Client::Deployment do
  let(:access_token) { 'my-access-token' }

  subject { BigPanda::Client.new(access_token: access_token) }

  describe ".start_deployment" do
    let(:response) { subject.start_deployment(options) }

    context "withut mandatory options" do
      let(:options) { {} }

      it "raise Argumnt Error" do
        expect { response }.to raise_error(ArgumentError)
      end
    end

    context "with all mandatory params", vcr: { cassette_name: 'start_deployment' } do

      let(:options) { { component: 'html-editor', version: '123' } }

      it "return status" do
        response['status'].should == 'created'
      end

      it "return id" do
        response['id'].should_not be_empty
      end
    end

    context "with all optional params", vcr: { cassette_name: 'start_deployment_with_optional' } do
      let(:options) {{
          component: 'html-editor', version: '123', timestamp: Time.now.to_i,
          description: 'Deploying new version', owner: 'Gregory Man',
          env: 'Production', source: 'chef', hosts: ['a1.wix.com', 'a2.wix.com']
        }}

        it "return status" do
          response['status'].should == 'created'
        end

        it "return id" do
          response['id'].should_not be_empty
        end
    end
  end

  describe ".start_deployment" do
    let(:response) { subject.finish_deployment(options) }

    context "without mandatory options" do
      let(:options) { {} }

      it "raise Argumnt Error" do
        expect { response }.to raise_error(ArgumentError)
      end
    end

    context "with mandatory params", vcr: { cassette_name: 'finish_deployment' } do
      let(:options) { { component: 'html-editor', version: '123' } }

      it "return status" do
        response['status'].should == 'created'
      end

      it "return id" do
        response['id'].should_not be_empty
      end
    end

    context "with optional params", vcr: { cassette_name: 'finish_deployment_with_optional' } do
      let(:options) {{
        component: 'html-editor', version: '123', timestamp: Time.now.to_i,
        status: 'failure', errorMessage: 'Ooops', hosts: ['a1.wix.com', 'a2.wix.com']
      }}

      it "return status" do
        response['status'].should == 'created'
      end

      it "return id" do
        response['id'].should_not be_empty
      end
    end
  end

end