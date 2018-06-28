require 'spec_helper'

describe PeertransferChat::Client do
  let(:slack_client) { instance_spy(Slackr) }
  let(:team_name) { 'a team' }
  let(:team_token) { 'a token' }
  let(:team_channel) { 'a channel' }
  let(:team_username) { 'a username' }
  let(:opts) { { 'channel' => team_channel, 'username' => team_username } }

  context 'with class configuration' do
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
        described_class.speak('hello')

        expect(slack_client).to have_received(:say).with('hello')

        PeertransferChat.reset!
      end
    end
  end

  context 'with instance configuration' do
    before do
      allow(Slackr).to receive(:connect).
        with(team_name, team_token, opts).
        and_return(slack_client)
    end

    let(:client) do
      PeertransferChat::Client.new do |c|
        c.team = team_name
        c.incoming_token = team_token
        c.channel = team_channel
        c.username = team_username
      end
    end

    describe '.say' do
      it 'speaks something to a channel' do
        client.speak('hello')

        expect(slack_client).to have_received(:say).with('hello')
      end
    end
  end
end
