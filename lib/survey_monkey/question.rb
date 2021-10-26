# frozen_string_literal: true

module SurveyMonkey
  class Question < Base
    
    class << self
      def benchmark(survey_id:, page_id:, question_id:, params: {})
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}/benchmark"
        request(method: :get, path: path, options: { query: params})
      end

      def create(survey_id:, page_id:, question:)
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions"
        request(method: :post, path: path, options: { body: question.to_json })
      end

      def destroy(survey_id:, page_id:, question_id:)
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}"
        request(method: :delete, path: path)
      end

      def find(survey_id:, page_id:, question_id:)
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}"
        request(method: :get, path: path)
      end

      def replace(survey_id:, page_id:, question_id:, question:)
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}"
        request(method: :put, path: path, options: { body: question.to_json })
      end

      def rollups(survey_id:, page_id:, question_id:, params: {})
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}/rollups"
        request(method: :get, path: path, options: { query: params})
      end

      def trends(survey_id:, page_id:, question_id:, params: {})
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}/trends"
        request(method: :get, path: path, options: { query: params})
      end

      def update(survey_id:, page_id:, question_id:, question:)
        path = "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}"
        request(method: :patch, path: path, options: { body: question.to_json })
      end
    end
  end
end
