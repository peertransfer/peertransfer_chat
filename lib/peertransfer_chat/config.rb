class PeertransferChat
  class Config
    SETTINGS = [:channel, :username, :api_token]

    attr_accessor(*SETTINGS)

    def valid?
      @api_token && @channel && @username
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
