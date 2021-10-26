# frozen_string_literal: true

module SurveyMonkey
  class Page < Base
    
    class << self
      def create(survey_id:, page: {})
        path = "/surveys/#{survey_id}/pages"
        request(method: :post, path: path, options: { body: page.to_json })
      end

      def destroy(survey_id:, page_id:)
        path = "/surveys/#{survey_id}/pages/#{page_id}"
        request(method: :delete, path: path)
      end

      def find(survey_id:, page_id:)
        path = "/surveys/#{survey_id}/pages/#{page_id}"
        request(method: :get, path: path)
      end

      def questions(survey_id:, page_id:, params: {})
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions"
        request(method: :get, path: path, options: { query: params})
      end

      def replace(survey_id:, page_id:, page:)
        path = "/surveys/#{survey_id}/pages/#{page_id}"
        request(method: :put, path: path, options: { body: page.to_json })
      end

      def rollups(survey_id:, page_id:, params: {})
        path = "/surveys/#{survey_id}/pages/#{page_id}/rollups"
        request(method: :get, path: path, options: { query: params})
      end

      def trends(survey_id:, page_id:, params: {})
        path = "/surveys/#{survey_id}/pages/#{page_id}/trends"
        request(method: :get, path: path, options: { query: params})
      end

      def update(survey_id:, page_id:, page:)
        path = "/surveys/#{survey_id}/pages/#{page_id}"
        request(method: :patch, path: path, options: { body: page.to_json })
      end
    end
  end
end
