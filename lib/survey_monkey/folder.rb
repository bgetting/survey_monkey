# frozen_string_literal: true

module SurveyMonkey
  class Folder < Base
    
    class << self
      def all(params: {})
        path = '/survey_folders'
        request(method: :get, path: path, options: { query: params})
      end

      def create(title:)
        path = '/survey_folders'
        body = { title: title } 
        request(method: :post, path: path, options: { body: body.to_json })
      end
    end
  end
end
