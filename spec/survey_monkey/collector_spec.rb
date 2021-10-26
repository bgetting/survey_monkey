# frozen_string_literal: true

RSpec.describe SurveyMonkey::Collector do
  let(:id) { 123456 }
  let(:recipient_id) { 789012 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#bulk_responses' do
    subject { described_class.bulk_responses(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}/responses/bulk" }
    
    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#delete' do
    subject { described_class.destroy(id: id) }

    let(:method) { :delete }
    let(:path) { "/collectors/#{id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#delete_recipient' do
    subject { described_class.delete_recipient(id: id, recipient_id: recipient_id) }

    let(:method) { :delete }
    let(:path) { "/collectors/#{id}/recipients/#{recipient_id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#delete_responses' do
    subject { described_class.delete_responses(id: id) }

    let(:method) { :delete }
    let(:path) { "/collectors/#{id}/responses" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#messages' do
    subject { described_class.messages(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}/messages" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#recipient' do
    subject { described_class.recipient(id: id, recipient_id: recipient_id) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}/recipients/#{recipient_id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#recipients' do
    subject { described_class.recipients(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}/recipients" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#replace' do
    subject { described_class.replace(id: id, collector: payload) }

    let(:method) { :put }
    let(:path) { "/collectors/#{id}" }
    
    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#responses' do
    subject { described_class.responses(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}/responses" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#stats' do
    subject { described_class.stats(id: id) }

    let(:method) { :get }
    let(:path) { "/collectors/#{id}/stats" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#update' do
    subject { described_class.update(id: id, collector: payload) }

    let(:method) { :patch }
    let(:path) { "/collectors/#{id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

end
