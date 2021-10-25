# frozen_string_literal: true

RSpec.describe SurveyMonkey::Message do
  let(:collector_id) { 123456 }
  let(:message_id) { 654321 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#add_recipient' do
    subject do
      described_class.add_recipient(
        collector_id: collector_id,
        message_id: message_id,
        recipient: payload
      )
    end

    let(:method) { :post }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}/recipients" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#bulk_add_recipient' do
    subject do
      described_class.bulk_add_recipient(
        collector_id: collector_id,
        message_id: message_id,
        recipients: payload
      )
    end

    let(:method) { :post }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}/recipients/bulk" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject do
      described_class.delete(collector_id: collector_id,message_id: message_id)
    end

    let(:method) { :delete }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject do
      described_class.find(collector_id: collector_id,message_id: message_id, params: params)
    end

    let(:method) { :get }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#recipients' do
    subject do
      described_class.recipients(collector_id: collector_id,message_id: message_id, params: params)
    end

    let(:method) { :get }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}/recipients" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#replace' do
    subject do
      described_class.replace(
        collector_id: collector_id,
        message_id: message_id,
        message: payload
      )
    end

    let(:method) { :put }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}" }
    
    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#send' do
    subject do
      described_class.send(collector_id: collector_id,message_id: message_id, send_at: send_at)
    end

    let(:method) { :post }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}/send" }

    context 'when send_at is not provided' do
      let(:send_at) { nil }

      it 'calls the correct endpoint and method' do
        expect(described_class).to receive(:request).with(method: method, path: path)
        subject
      end
    end
    
    context 'when send_at is provided' do
      let(:send_at) { 'Tuesday' }
      let(:body) do
        { body: { scheduled_at: send_at }.to_json }
      end

      it 'calls the correct endpoint and method' do
        expect(described_class).to receive(:request).with(method: method, path: path, options: body)
        subject
      end
    end
  end

  describe '#stats' do
    subject do
      described_class.stats(collector_id: collector_id,message_id: message_id)
    end

    let(:method) { :get }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}/stats" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#update' do
    subject do
      described_class.update(
        collector_id: collector_id,
        message_id: message_id,
        message: payload
      )
    end

    let(:method) { :patch }
    let(:path) { "/collectors/#{collector_id}/messages/#{message_id}" }
    
    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
