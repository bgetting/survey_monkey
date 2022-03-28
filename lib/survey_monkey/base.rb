# frozen_string_literal: true

module SurveyMonkey
  class Base
    include HTTParty
    base_uri 'https://api.surveymonkey.com/v3'
    headers({
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    })

    class << self
      def handle_error(error:, headers:)
        error_type = parse_error(error: error)
        raise "SurveyMonkey::#{error_type}".constantize.new(error[:message], error[:docs], headers)
      end

      def request(method:, path:, options: {})
        headers({ 'Authorization': "Bearer #{SurveyMonkey.configuration.api_token}" })
        response = self.send(method.to_s, path, **options)
        headers = response.headers
        response = response.deep_symbolize_keys
        return response unless response.has_key?(:error)
        handle_error(error: response[:error], headers: headers.to_h)
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
