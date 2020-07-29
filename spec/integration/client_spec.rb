require 'spec_helper'

describe PeertransferChat::Client do
  let(:slack_client) { instance_spy(Slack::Web::Client) }
  let(:team_channel) { 'a channel' }
  let(:team_username) { 'a username' }
  let(:api_token) { 'a_api_token' }

  context 'with class configuration' do
    before do
      PeertransferChat.configure do |c|
        c.channel = team_channel
        c.username = team_username
        c.api_token = api_token
      end

      allow(Slack::Web::Client).to receive(:new).
        with(token: api_token).
        and_return(slack_client)
    end

    describe '.speak' do
      it 'speaks something to a channel' do
        described_class.speak('hello')

        expect(slack_client).to have_received(:chat_postMessage).
          with(channel: team_channel, text: 'hello', as_user: true, username: team_username)

        PeertransferChat.reset!
      end
    end
  end

  context 'with instance configuration' do
    before do
      allow(Slack::Web::Client).to receive(:new).
        with(token: api_token).
        and_return(slack_client)
    end

    let(:client) do
      PeertransferChat::Client.new do |c|
        c.api_token = api_token
        c.channel = team_channel
        c.username = team_username
      end
    end

    describe '.speak' do
      it 'speaks something to a channel' do
        client.speak('hello')

        expect(slack_client).to have_received(:chat_postMessage).
          with(channel: team_channel, text: 'hello', as_user: true, username: team_username)
      end
    end
  end
end
