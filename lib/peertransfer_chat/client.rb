require 'slackr'

module PeertransferChat
  class Client

    def self.upload(filename)
      new.upload(filename)
    end

    def self.speak(something)
      new.speak(something)
    end

    def upload(filename)
      @slack = Slackr.connect(team, api_token, slack_opts)
      @slack.upload(filename, { 'channels' => channel_id })
    end

    def speak(message)
      @slack = Slackr.connect(team, incoming_token, slack_opts)
      @slack.say(message)
    end

    private

    def team
      config.team
    end

    def incoming_token
      config.incoming_token
    end

    def api_token
      config.api_token
    end

    def channel_id
      config.channel_id
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
  end
end
