require 'spec_helper'

describe PeertransferChat::Client do
  let(:slack_client) { instance_double(Slackr) }
  let(:team_name) { 'a team' }
  let(:team_token) { 'a token' }
  let(:team_channel){ 'a channel' }
  let(:team_username) { 'a username' }
  let(:opts) { { 'channel' => team_channel, 'username' => team_username } }

  before do
    allow(PeertransferChat).to receive(:config).and_return(
      double(
        PeertransferChat::Config,
        team: team_name,
        token: team_token,
        channel: team_channel,
        username: team_username
      )
    )

    allow(Slackr).to receive(:connect).
      with(team_name, team_token, opts).
      and_return(slack_client)
  end

  describe '.upload' do
    it 'uploads image to a channel' do
      expect(slack_client).to receive(:upload).with('/foo/bar.bin')

      described_class.upload('/foo/bar.bin')
    end
  end

  describe '.say' do
    it 'speaks something to a channel' do
      expect(slack_client).to receive(:say).with('hello')

      described_class.speak('hello')
    end
  end
end
