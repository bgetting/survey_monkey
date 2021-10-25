# frozen_string_literal: true

module SurveyMonkey
  class User < Base
    
    class << self
      def me
        path = '/users/me'
        request(method: :get, path: path)
      end

      def shared(user_id:, params: {})
        path = "/users/#{user_id}/shared"
        request(method: :get, path: path, options: { query: params})
      end

      def workgroups(user_id:, params: {})
        path = "/users/#{user_id}/workgroups"
        request(method: :get, path: path, options: { query: params})
      end
    end
  end
end
