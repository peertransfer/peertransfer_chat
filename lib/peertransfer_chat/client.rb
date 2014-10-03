require 'slackr'

module PeertransferChat
  class Client

    def self.upload(filename)
      new.upload(filename)
    end

    def self.speak(something)
      new.speak(something)
    end

    def initialize
      @slack = Slackr.connect(team, token, slack_opts)
    end

    def upload(filename)
      slack.upload(filename)
    end

    def speak(message)
      slack.say(message)
    end

    private

    def team
      config.team
    end

    def token
      config.token
    end

    def slack_opts
      {
        'channel' => config.channel,
        'username' => config.username
      }
    end

    def config
      PeertransferChat.config
    end

    attr_reader :slack
  end
end
