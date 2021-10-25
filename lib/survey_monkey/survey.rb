# frozen_string_literal: true

module SurveyMonkey
  class Survey < Base
    
    class << self
      def all(params: {})
        path = '/surveys'
        request(method: :get, path: path, options: { query: params})
      end

      def bulk_responses(id:, params: {})
        path = "/surveys/#{id}/responses/bulk"
        request(method: :get, path: path, options: { query: params})
      end

      def create(survey: {})
        path = '/surveys'
        request(method: :post, path: path, options: { body: survey.to_json })
      end

      def collectors(id:, params: {})
        path = "/surveys/#{id}/collectors"
        request(method: :get, path: path, options: { query: params})
      end

      def details(id:)
        path = "/surveys/#{id}/details"
        request(method: :get, path: path)
      end

      def find(id:)
        path = "/surveys/#{id}"
        request(method: :get, path: path)
      end

      def languages(id:, params: {})
        path = "/surveys/#{id}/languages"
        request(method: :get, path: path, options: { query: params})
      end

      def pages(id:)
        path = "/surveys/#{id}/pages"
        request(method: :get, path: path)
      end

      def responses(id:, params: {})
        path = "/surveys/#{id}/responses"
        request(method: :get, path: path, options: { query: params})
      end

      def rollups(id:, params: {})
        path = "/surveys/#{id}/rollups"
        request(method: :get, path: path, options: { query: params})
      end

      def trends(id:, params: {})
        path = "/surveys/#{id}/trends"
        request(method: :get, path: path, options: { query: params})
      end
    end
  end
end
