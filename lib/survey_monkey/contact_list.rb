# frozen_string_literal: true

module SurveyMonkey
  class ContactList < Base
    
    class << self
      def add_contact(id:, contact: {})
        path = "/contact_lists/#{id}/contacts"
        request(method: :post, path: path, options: { body: contact.to_json })
      end

      def all(params: {})
        path = '/contact_lists'
        request(method: :get, path: path, options: { query: params})
      end

      def bulk_add_contacts(id:, contacts: {})
        path = "/contact_lists/#{id}/contacts/bulk"
        request(method: :post, path: path, options: { body: contacts.to_json })
      end

      def bulk_contacts(id:, params: {})
        path = "/contact_lists/#{id}/contacts/bulk"
        request(method: :get, path: path, options: { query: params})
      end

      def contacts(id:, params: {})
        path = "/contact_lists/#{id}/contacts"
        request(method: :get, path: path, options: { query: params})
      end

      def copy(id:)
        path = "/contact_lists/#{id}/copy"
        request(method: :post, path: path)
      end

      def create(list:)
        path = '/contact_lists'
        body = { name: list }
        request(method: :post, path: path, options: { body: body.to_json })
      end

      def find(id:)
        path = "/contact_lists/#{id}"
        request(method: :get, path: path)
      end

      def merge(id:, source_list_id:)
        path = "/contact_lists/#{id}/merge"
        body = { list_id: source_list_id.to_s }
        request(method: :post, path: path, options: { body: body.to_json })
      end

      def replace(id:, list:)
        path = "/contact_lists/#{id}"
        request(method: :put, path: path, options: { body: list.to_json })
      end

      def update(id:, list:)
        path = "/contact_lists/#{id}"
        request(method: :patch, path: path, options: { body: list.to_json })
      end
    end
  end
end
