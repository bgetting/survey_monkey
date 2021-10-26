# frozen_string_literal: true

RSpec.describe SurveyMonkey::Question do
  let(:page_id) { 123456 }
  let(:question_id) { 789012 }
  let(:survey_id) { 654321 }
  let(:payload) { { key: 'value' } }
  let(:body) { { body: payload.to_json } }
  let(:params) { { page: 1 } }
  let(:query) { { query: params } }

  describe '#benchmark' do
    subject do
      described_class.benchmark(
        survey_id: survey_id,
        page_id: page_id,
        question_id: question_id,
        params: params
      )
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}/benchmark" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end
  
  describe '#create' do
    subject do
      described_class.create(survey_id: survey_id, page_id: page_id, question: payload)
    end

    let(:method) { :post }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#delete' do
    subject do
      described_class.destroy(survey_id: survey_id, page_id: page_id, question_id: question_id)
    end

    let(:method) { :delete }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#find' do
    subject do
      described_class.find(survey_id: survey_id, page_id: page_id, question_id: question_id)
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path)
      subject
    end
  end

  describe '#replace' do
    subject do
      described_class.replace(
        survey_id: survey_id,
        page_id: page_id,
        question_id: question_id,
        question: payload
      )
    end

    let(:method) { :put }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end

  describe '#rollups' do
    subject do
      described_class.rollups(
        survey_id: survey_id,
        page_id: page_id,
        question_id: question_id,
        params: params
      )
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}/rollups" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#trends' do
    subject do
      described_class.trends(
        survey_id: survey_id,
        page_id: page_id,
        question_id: question_id,
        params: params
      )
    end

    let(:method) { :get }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}/trends" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: query)
      subject
    end
  end

  describe '#update' do
    subject do
      described_class.update(
        survey_id: survey_id,
        page_id: page_id,
        question_id: question_id,
        question: payload
      )
    end

    let(:method) { :patch }
    let(:path) { "/surveys/#{survey_id}/pages/#{page_id}/questions/#{question_id}" }

    it 'calls the correct API endpoint' do
      expect(described_class).to receive(:request).with(method: method, path: path, options: body)
      subject
    end
  end
end
