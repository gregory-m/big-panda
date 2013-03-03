require "spec_helper"

describe BigPanda::Helper do
  include BigPanda::Helper

  describe ".check_mandatory_options" do
    let(:options) { { auth_token: '123', url: 'http://google.com' } }

    context "with all mandatory options" do
      let(:mandatory_options) { [:auth_token] }

      it "return true" do
        check_mandatory_options(options, mandatory_options).should be_true
      end
    end

    context "without all mandatory options" do
      let(:mandatory_options) { [:auth_token, :not_existing_option] }

      it "raise ArgumentError" do
        expect {
          check_mandatory_options(options, mandatory_options)
        }.to raise_error(ArgumentError)
      end

      it "provides message with option name" do
        expect {
          check_mandatory_options(options, mandatory_options)
        }.to raise_error(ArgumentError, 'option not_existing_option is mandatory')
      end
    end
  end
end