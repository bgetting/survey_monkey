# frozen_string_literal: true

RSpec.describe SurveyMonkey::BenchmarkBundle do
  let(:id) { 123456 }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/benchmark_bundles' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#analyze' do
    subject { described_class.analyze(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/benchmark_bundles/#{id}/analyze" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/benchmark_bundles/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end
end
