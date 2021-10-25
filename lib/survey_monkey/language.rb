# frozen_string_literal: true

module SurveyMonkey
  class Language < Base
    
    class << self
      def all(params: {})
        path = '/survey_languages'
        request(method: :get, path: path, options: { query: params})
      end
    end
  end
end
