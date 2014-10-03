module PeertransferChat
  class Config
    SETTINGS = [:team, :channel, :token, :username]

    attr_accessor *SETTINGS

    def valid?
      @team && @channel && @token && @username
    end
  end

  class << self
    def configure
      @config ||= Config.new
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
