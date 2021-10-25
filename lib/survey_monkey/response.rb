# frozen_string_literal: true

module SurveyMonkey
  class Response < Base
    
    class << self
      def create(collector_id:, response:)
        path = "/collectors/#{collector_id}/responses"
        request(method: :post, path: path, options: { body: response.to_json })
      end

      def delete(collector_id:, response_id:)
        path = "/collectors/#{collector_id}/responses/#{response_id}"
        request(method: :delete, path: path)
      end

      def find(collector_id:, response_id:)
        path = "/collectors/#{collector_id}/responses/#{response_id}"
        request(method: :get, path: path)
      end

      def replace(collector_id:, response_id:, response:)
        path = "/collectors/#{collector_id}/responses/#{response_id}"
        request(method: :put, path: path, options: { body: response.to_json })
      end

      def update(collector_id:, response_id:, response:)
        path = "/collectors/#{collector_id}/responses/#{response_id}"
        request(method: :patch, path: path, options: { body: response.to_json })
      end
    end
  end
end
