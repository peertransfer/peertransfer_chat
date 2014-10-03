require 'slackr'
require 'peertransfer_chat/config'

module PeertransferChat
  class Client
    def self.upload(filename)
      new.upload(filename)
    end

    def self.speak(something)
      new.speak(something)
    end

    def initialize
      team = PeertransferChat.config.team
      token = PeertransferChat.config.token
      opts = {
        'channel' => PeertransferChat.config.channel,
        'username' => PeertransferChat.config.username
      }
      @slack = Slackr.connect(team, token, opts)
    end

    def upload(filename)
      slack.upload(filename)
    end

    def speak(message)
      slack.say(message)
    end

    private

    attr_reader :slack
  end
end
