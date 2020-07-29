require 'spec_helper'

describe PeertransferChat::Client do
  let(:slack_client) { instance_spy(Slack::Web::Client) }
  let(:api_token) { 'an api token' }
  let(:team_channel) { 'a channel' }
  let(:team_username) { 'a username' }

  before do
    allow(PeertransferChat).to receive(:config).and_return(
      double(
        PeertransferChat::Config,
        channel: team_channel,
        username: team_username,
        api_token: api_token
      )
    )
  end

  describe '.upload' do
    let(:filename) { '/foo/bar.bin' }

    it 'uploads image to a channel' do
      allow(Slack::Web::Client).to receive(:new).
        with(token: api_token).
        and_return(slack_client)

      file_io = instance_double(Faraday::UploadIO)

      allow(Faraday::UploadIO).to receive(:new).with(filename, 'image/png').
        and_return(file_io)

      described_class.upload(filename)

      expect(slack_client).to have_received(:files_upload). with(
        channels: team_channel,
        as_user: true,
        file: file_io,
        title: 'output.txt',
        filename: filename,
        initial_comment: 'Attachment'
      )

    end
  end

  describe '.speak' do
    it 'speaks something to a channel' do
      allow(Slack::Web::Client).to receive(:new).
        with(token: api_token).
        and_return(slack_client)

      described_class.speak('hello')

      expect(slack_client).to have_received(:chat_postMessage).
          with(channel: team_channel, text: 'hello', as_user: true, username: team_username)
    end
  end
end
