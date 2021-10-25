# frozen_string_literal: true

module SurveyMonkey
  class Message < Base
    
    class << self
      def add_recipient(collector_id:, message_id:, recipient:)
        path = "/collectors/#{collector_id}/messages/#{message_id}/recipients"
        request(method: :post, path: path, options: { body: recipient.to_json })
      end

      def bulk_add_recipient(collector_id:, message_id:, recipients:)
        path = "/collectors/#{collector_id}/messages/#{message_id}/recipients/bulk"
        request(method: :post, path: path, options: { body: recipients.to_json })
      end

      def delete(collector_id:, message_id:)
        path = "/collectors/#{collector_id}/messages/#{message_id}"
        request(method: :delete, path: path)
      end

      def find(collector_id:, message_id:, params: {})
        path = "/collectors/#{collector_id}/messages/#{message_id}"
        request(method: :get, path: path, options: { query: params})
      end

      def recipients(collector_id:, message_id:, params: {})
        path = "/collectors/#{collector_id}/messages/#{message_id}/recipients"
        request(method: :get, path: path, options: { query: params})
      end

      def replace(collector_id:, message_id:, message:)
        path = "/collectors/#{collector_id}/messages/#{message_id}"
        request(method: :put, path: path, options: { body: message.to_json })
      end

      def send(collector_id:, message_id:, send_at: nil)
        path = "/collectors/#{collector_id}/messages/#{message_id}/send"
        if send_at
          request(method: :post, path: path, options: { body: { scheduled_at: send_at }.to_json })
        else
          request(method: :post, path: path)
        end
      end

      def stats(collector_id:, message_id:)
        path = "/collectors/#{collector_id}/messages/#{message_id}/stats"
        request(method: :get, path: path)
      end

      def update(collector_id:, message_id:, message:)
        path = "/collectors/#{collector_id}/messages/#{message_id}"
        request(method: :patch, path: path, options: { body: message.to_json })
      end
    end
  end
end
