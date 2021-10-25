# frozen_string_literal: true

RSpec.describe SurveyMonkey::ContactList do
  let(:id) { 123456 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#add_contact' do
    subject { described_class.add_contact(id: id, contact: payload) }

    let(:method) { :post }
    let(:path) { "/contact_lists/#{id}/contacts" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/contact_lists' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#bulk_add_contacts' do
    subject { described_class.bulk_add_contacts(id: id, contacts: payload) }

    let(:method) { :post }
    let(:path) { "/contact_lists/#{id}/contacts/bulk" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#bulk_contacts' do
    subject { described_class.bulk_contacts(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/contact_lists/#{id}/contacts/bulk" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#contacts' do
    subject { described_class.contacts(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/contact_lists/#{id}/contacts" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#copy' do
    subject { described_class.copy(id: id) }

    let(:method) { :post }
    let(:path) { "/contact_lists/#{id}/copy" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#create' do
    subject { described_class.create(list: name) }

    let(:method) { :post }
    let(:path) { '/contact_lists' }
    let(:name) { 'List Name' }
    let(:body) do
      { body: { name: name }.to_json }
    end

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/contact_lists/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#merge' do
    subject { described_class.merge(id: id, source_list_id: source_list_id) }

    let(:method) { :post }
    let(:path) { "/contact_lists/#{id}/merge" }
    let(:source_list_id) { 67890 }
    let(:body) do
      { body: { list_id: source_list_id.to_s }.to_json }
    end

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#replace' do
    subject { described_class.replace(id: id, list: payload) }

    let(:method) { :put }
    let(:path) { "/contact_lists/#{id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#update' do
    subject { described_class.update(id: id, list: payload) }

    let(:method) { :patch }
    let(:path) { "/contact_lists/#{id}" }

    it 'calls the correct endpoint and method' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
