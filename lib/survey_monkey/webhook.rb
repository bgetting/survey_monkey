# frozen_string_literal: true

module SurveyMonkey
  class Webhook < Base
    
    class << self
      def all(params: {})
        path = '/webhooks'
        request(method: :get, path: path, options: { query: params})
      end

      def create(webhook:)
        path = '/webhooks'
        request(method: :post, path: path, options: { body: webhook.to_json })
      end

      def destroy(id:)
        path = "/webhooks/#{id}"
        request(method: :delete, path: path)
      end

      def find(id:)
        path = "/webhooks/#{id}"
        request(method: :get, path: path)
      end

      def replace(id:, webhook:)
        path = "/webhooks/#{id}"
        request(method: :put, path: path, options: { body: webhook.to_json })
      end

      def update(id:, webhook:)
        path = "/webhooks/#{id}"
        request(method: :patch, path: path, options: { body: webhook.to_json })
      end
    end
  end
end
