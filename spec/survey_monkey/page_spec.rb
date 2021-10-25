# frozen_string_literal: true

RSpec.describe SurveyMonkey::Page do
  let(:page_id) { 123456 }
  let(:survey_id) { 654321 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#create' do
    subject do
      described_class.create(survey_id: survey_id, page: payload)
    end

    let(:method) { :post }
    let(:path) { "/surveys/#{survey_id}/pages" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject do
      described_class.delete(survey_id: survey_id, page_id: page_id)
    end

    let(:method) { :delete }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject do
      described_class.find(survey_id: survey_id, page_id: page_id)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#questions' do
    subject do
      described_class.questions(survey_id: survey_id, page_id: page_id, params: params)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#replace' do
    subject do
      described_class.replace(survey_id: survey_id, page_id: page_id, page: payload)
    end

    let(:method) { :put }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#rollups' do
    subject do
      described_class.rollups(survey_id: survey_id, page_id: page_id, params: params)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/rollups" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#trends' do
    subject do
      described_class.trends(survey_id: survey_id, page_id: page_id, params: params)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/trends" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#update' do
    subject do
      described_class.update(survey_id: survey_id, page_id: page_id, page: payload)
    end

    let(:method) { :patch }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

end
