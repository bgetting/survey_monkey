# frozen_string_literal: true

RSpec.describe SurveyMonkey::ContactField do
  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/contact_fields' }
    let(:params) { { page: 1 } }
    let(:query) { { query: params } }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/contact_fields/#{id}" }
    let(:id) { 123456 }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end
end
