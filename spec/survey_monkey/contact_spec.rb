# frozen_string_literal: true

RSpec.describe SurveyMonkey::Contact do
  let(:id) { 123456 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/contacts' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#bulk' do
    subject { described_class.bulk(params: params) }

    let(:method) { :get }
    let(:path) { '/contacts/bulk' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#bulk_create' do
    subject { described_class.bulk_create(contacts: payload) }

    let(:method) { :post }
    let(:path) { '/contacts/bulk' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#create' do
    subject { described_class.create(contact: payload) }

    let(:method) { :post }
    let(:path) { '/contacts' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject { described_class.destroy(id: id) }

    let(:method) { :delete }
    let(:path) { "/contacts/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/contacts/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end
end
