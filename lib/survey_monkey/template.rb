# frozen_string_literal: true

module SurveyMonkey
  class Template < Base
    
    class << self
      def all(params: {})
        path = '/survey_templates'
        request(method: :get, path: path, options: { query: params})
      end
    end
  end
end
