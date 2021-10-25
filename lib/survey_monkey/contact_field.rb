# frozen_string_literal: true

module SurveyMonkey
  class ContactField < Base
    
    class << self
      def all(params: {})
        path = '/contact_fields'
        request(method: :get, path: path, options: { query: params})
      end

      def find(id:)
        path = "/contact_fields/#{id}"
        request(method: :get, path: path)
      end
    end
  end
end
