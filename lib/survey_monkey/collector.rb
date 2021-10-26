# frozen_string_literal: true

module SurveyMonkey
  class Collector < Base
    class << self
      def bulk_responses(id:, params: {})
        path = "/collectors/#{id}/responses/bulk"
        request(method: :get, path: path, options: { query: params})
      end

      def destroy(id:)
        path = "/collectors/#{id}"
        request(method: :delete, path: path)
      end

      def delete_recipient(id:, recipient_id:)
        path = "/collectors/#{id}/recipients/#{recipient_id}"
        request(method: :delete, path: path)
      end

      def delete_responses(id:)
        path = "/collectors/#{id}/responses"
        request(method: :delete, path: path)
      end

      def find(id:)
        path = "/collectors/#{id}"
        request(method: :get, path: path)
      end

      def messages(id:, params: {})
        path = "/collectors/#{id}/messages"
        request(method: :get, path: path, options: { query: params})
      end

      def recipient(id:, recipient_id:)
        path = "/collectors/#{id}/recipients/#{recipient_id}"
        request(method: :get, path: path)
      end

      def recipients(id:, params: {})
        path = "/collectors/#{id}/recipients"
        request(method: :get, path: path, options: { query: params})
      end

      def replace(id:, collector:)
        path = "/collectors/#{id}"
        request(method: :put, path: path, options: { body: collector.to_json })
      end

      def responses(id:, params: {})
        path = "/collectors/#{id}/responses"
        request(method: :get, path: path, options: { query: params})
      end

      def stats(id:)
        path = "/collectors/#{id}/stats"
        request(method: :get, path: path)
      end

      def update(id:, collector:)
        path = "/collectors/#{id}"
        request(method: :patch, path: path, options: { body: collector.to_json })
      end
    end
  end
end
