# frozen_string_literal: true

module SurveyMonkey
  class BenchmarkBundle < Base
    class << self
      def all(params: {})
        path = '/benchmark_bundles'
        request(method: :get, path: path, options: { query: params })
      end

      def analyze(id:, params: {})
        path = "/benchmark_bundles/#{id}/analyze"
        request(method: :get, path: path, options: { query: params })
      end

      def find(id:)
        path = "/benchmark_bundles/#{id}"
        request(method: :get, path: path)
      end
    end
  end
end
