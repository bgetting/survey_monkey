# frozen_string_literal: true

RSpec.describe SurveyMonkey::Folder do
  let(:id) { 123456 }
  let(:title) { 'Title' }
  let(:folder) { { title: title } }
  let(:body) { { body: folder.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/survey_folders' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#create' do
    subject { described_class.create(title: title) }

    let(:method) { :post }
    let(:path) { '/survey_folders' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
