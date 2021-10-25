# frozen_string_literal: true

RSpec.describe SurveyMonkey::Survey do
  let(:id) { 123456 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/surveys' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#bulk_responses' do
    subject { described_class.bulk_responses(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/responses/bulk" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#create' do
    subject do
      described_class.create(survey: payload)
    end

    let(:method) { :post }
    let(:path) { '/surveys' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#collectors' do
    subject { described_class.collectors(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/collectors" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#details' do
    subject { described_class.details(id: id) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/details" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject do
      described_class.find(id: id)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#languages' do
    subject { described_class.languages(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/languages" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#pages' do
    subject do
      described_class.pages(id: id)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/pages" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#responses' do
    subject { described_class.responses(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/responses" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#rollups' do
    subject { described_class.rollups(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/rollups" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#trends' do
    subject { described_class.trends(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/surveys/#{id}/trends" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end
end
