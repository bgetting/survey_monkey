# frozen_string_literal: true

RSpec.describe SurveyMonkey::Webhook do
  let(:id) { 123456 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/webhooks' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#create' do
    subject do
      described_class.create(webhook: payload)
    end

    let(:method) { :post }
    let(:path) { '/webhooks' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject do
      described_class.delete(id: id)
    end

    let(:method) { :delete }
    let(:path) { "/webhooks/#{id}" }

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
    let(:path) { "/webhooks/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#replace' do
    subject do
      described_class.replace(id: id, webhook: payload)
    end

    let(:method) { :put }
    let(:path) { "/webhooks/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#update' do
    subject do
      described_class.update(id: id, webhook: payload)
    end

    let(:method) { :patch }
    let(:path) { "/webhooks/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
