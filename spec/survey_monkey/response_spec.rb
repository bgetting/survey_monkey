# frozen_string_literal: true

RSpec.describe SurveyMonkey::Response do
  let(:collector_id) { 123456 }
  let(:response_id) { 654321 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }

  describe '#create' do
    subject do
      described_class.create(collector_id: collector_id, response: payload)
    end

    let(:method) { :post }
    let(:path) { "/collectors/#{collector_id}/responses" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject do
      described_class.destroy(collector_id: collector_id, response_id: response_id)
    end

    let(:method) { :delete }
    let(:path) { "/collectors/#{collector_id}/responses/#{response_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#details' do
    subject do
      described_class.details(collector_id: collector_id, response_id: response_id)
    end

    let(:method) { :get }
    let(:path) { "/collectors/#{collector_id}/responses/#{response_id}/details" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject do
      described_class.find(collector_id: collector_id, response_id: response_id)
    end

    let(:method) { :get }
    let(:path) { "/collectors/#{collector_id}/responses/#{response_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#replace' do
    subject do
      described_class.replace(
        collector_id: collector_id,
        response_id: response_id,
        response: payload
      )
    end

    let(:method) { :put }
    let(:path) { "/collectors/#{collector_id}/responses/#{response_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#update' do
    subject do
      described_class.update(
        collector_id: collector_id,
        response_id: response_id,
        response: payload
      )
    end

    let(:method) { :patch }
    let(:path) { "/collectors/#{collector_id}/responses/#{response_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
