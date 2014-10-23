require 'spec_helper'

describe PeertransferChat::Client do
  let(:slack_client) { instance_double(Slackr) }
  let(:team_name) { 'a team' }
  let(:team_token) { 'a token' }
  let(:team_channel) { 'a channel' }
  let(:team_username) { 'a username' }
  let(:opts) { { 'channel' => team_channel, 'username' => team_username } }

  after do
   PeertransferChat.reset!
  end

  before do
    PeertransferChat.configure do |c|
      c.team = team_name
      c.incoming_token = team_token
      c.channel = team_channel
      c.username = team_username
    end

    allow(Slackr).to receive(:connect).
      with(team_name, team_token, opts).
      and_return(slack_client)
  end

  describe '.say' do
    it 'speaks something to a channel' do
      expect(slack_client).to receive(:say).with('hello')

      described_class.speak('hello')
    end
  end
end
