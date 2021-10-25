# frozen_string_literal: true

module SurveyMonkey
  class QuestionBank < Base
    
    class << self
      def all(params: {})
        path = '/question_bank/questions'
        request(method: :get, path: path, options: { query: params})
      end
    end
  end
end
