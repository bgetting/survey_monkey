# frozen_string_literal: true

module SurveyMonkey
  class Category < Base
    class << self
      def all(params: {})
        path = '/survey_categories'
        request(method: :get, path: path, options: { query: params })
      end
    end
  end
end
