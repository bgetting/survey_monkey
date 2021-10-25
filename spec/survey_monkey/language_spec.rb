# frozen_string_literal: true

RSpec.describe SurveyMonkey::Language do
  let(:id) { 123456 }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/survey_languages' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end
end
