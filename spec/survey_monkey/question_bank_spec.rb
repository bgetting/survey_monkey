# frozen_string_literal: true

RSpec.describe SurveyMonkey::QuestionBank do
  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/question_bank/questions' }
    let(:params) { { page: 1 } }
    let(:query) { { query: params } }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end
end
