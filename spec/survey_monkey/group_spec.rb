# frozen_string_literal: true

RSpec.describe SurveyMonkey::Group do
  let(:id) { 123456 }
  let(:type) { 'invite_created' }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#activity' do
    subject { described_class.activity(id: id, type: type, params: params) }

    let(:method) { :get }
    let(:path) { "/groups/#{id}/activities/#{type}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#activities' do
    subject { described_class.activities(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/groups/#{id}/activities" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#all' do
    subject { described_class.all(params: params) }

    let(:method) { :get }
    let(:path) { '/groups' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#find' do
    subject { described_class.find(id: id) }

    let(:method) { :get }
    let(:path) { "/groups/#{id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#member' do
    subject { described_class.member(id: id, member_id: member_id) }

    let(:method) { :get }
    let(:member_id) { 6789 }
    let(:path) { "/groups/#{id}/members/#{member_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#members' do
    subject { described_class.members(id: id, params: params) }

    let(:method) { :get }
    let(:path) { "/groups/#{id}/members" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end
end
