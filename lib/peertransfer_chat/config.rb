class PeertransferChat
  class Config
    SETTINGS = [:team, :channel, :incoming_token, :username, :api_token, :channel_id]

    attr_accessor(*SETTINGS)

    def valid?
      @team && @channel && @incoming_token && @username
    end
  end

  def config
    @config ||= Config.new
  end

  class << self
    def configure
      @config ||= new.config
      yield(@config)
    end

    def reset!
      @config = Config.new
    end

    def config
      raise('configuration is wrong') unless @config.valid?
      @config
    end
  end
end
