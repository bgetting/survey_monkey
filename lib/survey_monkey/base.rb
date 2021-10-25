# frozen_string_literal: true

module SurveyMonkey
  class Base
    include HTTParty
    base_uri 'https://api.surveymonkey.com/v3'
    headers(
      {
        'Accept': 'application/json',
        'Authorization': "Bearer #{ENV.fetch('SURVEY_MONKEY_API_TOKEN', nil)}",
        'Content-Type': 'application/json'
      }
    )

    class << self
      def handle_error(error:)
        error_type = parse_error(error: error)
        raise "SurveyMonkey::#{error_type}".constantize.new(error[:message], error[:docs])
      end

      def request(method:, path:, options: {})
        raise NoApiTokenError unless ENV.fetch('SURVEY_MONKEY_API_TOKEN')
        response = self.send(method.to_s, path, **options).deep_symbolize_keys
        return response unless response.has_key?(:error)
        handle_error(error: response[:error])
      end

      private

      def parse_error(error:)
        case error[:http_status_code]
        when 400
          'BadRequestError'
        when 401
          'AuthorizationError'
        when 403
          'PermissionError'
        when 404
          'NotFoundError'
        when 409
          'ResourceConflictError'
        when 410
          'UserDeletedError'
        when 413
          'EntityTooLargeError'
        when 429
          'RateLimitReachedError'
        when 500
          'InternalServerError'
        when 503
          'InternalServerError'
        else
          'BadGatewayError'
        end
      end
    end
  end
end
