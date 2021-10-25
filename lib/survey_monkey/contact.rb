# frozen_string_literal: true

module SurveyMonkey
  class Contact < Base
    
    class << self
      def all(params: {})
        path = '/contacts'
        request(method: :get, path: path, options: { query: params})
      end

      def bulk(params: {})
        path = '/contacts/bulk'
        request(method: :get, path: path, options: { query: params})
      end

      def bulk_create(contacts: {})
        path = '/contacts/bulk'
        request(method: :post, path: path, options: { body: contacts.to_json })
      end

      def create(contact: {})
        path = '/contacts'
        request(method: :post, path: path, options: { body: contact.to_json })
      end

      def delete(id:)
        path = "/contacts/#{id}"
        request(method: :delete, path: path)
      end

      def find(id:)
        path = "/contacts/#{id}"
        request(method: :get, path: path)
      end
    end
  end
end
