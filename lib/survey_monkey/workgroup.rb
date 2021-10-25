# frozen_string_literal: true

module SurveyMonkey
  class Workgroup < Base
    
    class << self
      def add_member(id:, member:)
        path = "/workgroups/#{id}/members"
        request(method: :post, path: path, options: { body: member.to_json })
      end

      def bulk_add_members(id:, members:)
        path = "/workgroups/#{id}/members/bulk"
        request(method: :post, path: path, options: { body: members.to_json })
      end

      def bulk_add_shares(id:, shares:)
        path = "/workgroups/#{id}/shares/bulk"
        request(method: :post, path: path, options: { body: shares.to_json })
      end

      def all(params: {})
        path = '/workgroups'
        request(method: :get, path: path, options: { query: params})
      end

      def create(workgroup:)
        path = '/workgroups'
        request(method: :post, path: path, options: { body: workgroup.to_json })
      end

      def delete(id:)
        path = "/workgroups/#{id}"
        request(method: :delete, path: path)
      end

      def find(id:)
        path = "/workgroups/#{id}"
        request(method: :get, path: path)
      end

      def member(id:, member_id:)
        path = "/workgroups/#{id}/members/#{member_id}"
        request(method: :get, path: path)
      end

      def members(id:, params: {})
        path = "/workgroups/#{id}/members"
        request(method: :get, path: path, options: { query: params})
      end

      def roles(params: {})
        path = '/roles'
        request(method: :get, path: path, options: { query: params})
      end

      def shares(id:, params: {})
        path = "/workgroups/#{id}/shares"
        request(method: :get, path: path, options: { query: params})
      end

      def update(id:, workgroup:)
        path = "/workgroups/#{id}"
        request(method: :patch, path: path, options: { body: workgroup.to_json })
      end

    end
  end
end
