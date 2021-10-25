# frozen_string_literal: true

RSpec.describe SurveyMonkey::Workgroup do
  let(:id) { 123456 }
  let(:member_id) { 654321 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#add_member' do
    subject { described_class.add_member(id: id, member: payload) }

    let(:method) { :post }
    let(:path) { "/workgroups/#{id}/members" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#bulk_add_members' do
    subject { described_class.bulk_add_members(id: id, members: payload) }

    let(:method) { :post }
    let(:path) { "/workgroups/#{id}/members/bulk" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#bulk_add_shares' do
    subject { described_class.bulk_add_shares(id: id, shares: payload) }

    let(:method) { :post }
    let(:path) { "/workgroups/#{id}/shares/bulk" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/workgroups' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#create' do
    subject { described_class.create(workgroup: payload) }

    let(:method) { :post }
    let(:path) { '/workgroups' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject { described_class.delete(id: id) }

    let(:method) { :delete }
    let(:path) { "/workgroups/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/workgroups/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#member' do
    subject { described_class.member(id: id, member_id: member_id) }

    let(:method) { :get }
    let(:path) { "/workgroups/#{id}/members/#{member_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#members' do
    subject { described_class.members(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/workgroups/#{id}/members" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#roles' do
    subject { described_class.roles(params: params) }

    let(:method) { :get }
    let(:path) { '/roles' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#shares' do
    subject { described_class.shares(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/workgroups/#{id}/shares" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#update' do
    subject { described_class.update(id: id, workgroup: payload) }

    let(:method) { :patch }
    let(:path) { "/workgroups/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
