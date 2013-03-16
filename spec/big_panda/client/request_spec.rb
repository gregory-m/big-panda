require "spec_helper"
describe BigPanda::Client::Deployment do
  let(:access_token) { 'bad-access-token' }
  subject { BigPanda::Client.new(access_token: access_token) }

  describe ".post" do
    context "on Unauthorized response", vcr: { cassette_name: 'unauthorized' } do
      it "raise BigPanda::Client::Unauthorized" do
        expect {
          subject.post('/test')
        }.to raise_error(BigPanda::Client::Unauthorized)
      end
    end
  end
end