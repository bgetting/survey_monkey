module SurveyMonkey
  class Configuration
    attr_writer :api_secret, :api_token

    def initialize
      @api_secret = nil
      @api_token = nil
    end

    def api_secret
      raise SurveyMonkey::ConfigurationError, 'Survey Monkey API secret is missing!' unless @api_secret
      @api_secret
    end

    def api_token
      raise SurveyMonkey::ConfigurationError, 'Survey Monkey API token is missing!' unless @api_token
      @api_token
    end
  end
end
