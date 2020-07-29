require 'slack-ruby-client'

class PeertransferChat
  class Client
    attr_accessor :config

    def self.upload(filename)
      new.upload(filename)
    end

    def self.speak(something)
      new.speak(something)
    end

    def initialize
      if block_given?
        @config = Config.new
        yield(@config)
      end
    end

    def upload(filename, opts = {})
      client.files_upload(
        channels: channel,
        as_user: true,
        file: Faraday::UploadIO.new(filename, 'image/png'),
        title: 'output.txt',
        filename: filename,
        initial_comment: 'Attachment'
      )
    end

    def speak(message)
      client.chat_postMessage(channel: channel, text: message, as_user: true, username: username)
    end

    private

    def client
      @client ||= Slack::Web::Client.new(token: api_token)
    end

    def channel
      config.channel
    end

    def api_token
      config.api_token
    end

    def username
      config.username
    end

    def config
      @config ||= PeertransferChat.config
    end
  end
end
