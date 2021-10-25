# frozen_string_literal: true

module SurveyMonkey
  class Group < Base
    
    class << self
      def activity(id:, type:, params: {})
        path = "/groups/#{id}/activities/#{type}"
        request(method: :get, path: path, options: { query: params})
      end

      def activities(id:, params: {})
        path = "/groups/#{id}/activities"
        request(method: :get, path: path, options: { query: params})
      end

      def all(params: {})
        path = '/groups'
        request(method: :get, path: path, options: { query: params})
      end

      def find(id:)
        path = "/groups/#{id}"
        request(method: :get, path: path)
      end

      def member(id:, member_id:)
        path = "/groups/#{id}/members/#{member_id}"
        request(method: :get, path: path)
      end

      def members(id:, params: {})
        path = "/groups/#{id}/members"
        request(method: :get, path: path, options: { query: params})
      end
    end
  end
end
