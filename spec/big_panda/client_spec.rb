require "spec_helper"

describe BigPanda::Client do
  let(:target_url) { 'https://api.bigpanda.io' }

  describe "#initialize" do

    subject { BigPanda::Client }

    context "without access_token" do
      it "raise Argument Error" do
        expect { subject.new }.to raise_error(ArgumentError)
      end
    end

    context "with all mandatory options" do
      let(:options) { { access_token: 'my-access-token' } }
      subject { BigPanda::Client.new(options) }

      it "not raise errors" do
        subject
      end

      it "set default target URL" do
        subject.target_url.should == target_url
      end

    end
  end
end