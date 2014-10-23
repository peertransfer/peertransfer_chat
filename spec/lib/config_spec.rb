require 'spec_helper'

describe PeertransferChat::Config do
  let(:team_name) { 'a team' }
  let(:team_token) { 'a token' }
  let(:team_channel) { 'a channel' }
  let(:team_username) { 'a username' }

  context 'when configured' do
    before do
      PeertransferChat.configure do |config|
        config.team = team_name
        config.incoming_token = team_token
        config.channel = team_channel
        config.username = team_username
      end
    end

    describe '.reset' do
      it 'reset any previous config' do
        PeertransferChat.reset!

        expect do
          PeertransferChat.config.username
        end.to raise_error('configuration is wrong')
      end
    end

    it 'stores config' do
      expect(PeertransferChat.config.team).to eq('a team')
    end
  end

  context 'not configured' do
    before do
      PeertransferChat.configure do |config|
        config.team = team_name
        config.incoming_token = team_token
        config.channel = team_channel
      end
    end

    it 'raises an exception if all values are not set' do
      expect do
        PeertransferChat.config.username
      end.to raise_error('configuration is wrong')
    end
  end
end
