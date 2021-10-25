# frozen_string_literal: true

RSpec.describe SurveyMonkey::User do
  let(:user_id) { 123456 }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#me' do
    subject { described_class.me }

    let(:method) { :get }
    let(:path) { '/users/me' }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#shared' do
    subject { described_class.shared(user_id: user_id, params: params) }

    let(:method) { :get }
    let(:path) { "/users/#{user_id}/shared" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#workgroups' do
    subject { described_class.workgroups(user_id: user_id, params: params) }

    let(:method) { :get }
    let(:path) { "/users/#{user_id}/workgroups" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

end
