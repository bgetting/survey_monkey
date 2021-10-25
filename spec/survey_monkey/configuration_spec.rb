# frozen_string_literal: true

RSpec.describe SurveyMonkey::Configuration do
  let(:secret) { 'FAKE-SECRET' }
  let(:token) { 'FAKE-SECRET' }

  before do
    SurveyMonkey.configure do |config|
      config.api_secret = secret
      config.api_token = token
    end
  end

  context 'when configured' do
    it 'returns the correct secret' do
      expect(SurveyMonkey.configuration.api_secret).to eq(secret)
    end

    it 'returns the correct token' do
      expect(SurveyMonkey.configuration.api_token).to eq(token)
    end
  end

  context 'when not configured' do
    before do
      SurveyMonkey.reset
    end

    it 'raises a ConfigurationError for the secret' do
      expect { SurveyMonkey.configuration.api_secret }.to raise_error(SurveyMonkey::ConfigurationError)
    end

    it 'raises a ConfigurationError for the token' do
      expect { SurveyMonkey.configuration.api_token }.to raise_error(SurveyMonkey::ConfigurationError)
    end
  end

  describe '#reset' do
    it 'resets the configured values' do
      expect(SurveyMonkey.configuration.api_secret).to eq(secret)
      expect(SurveyMonkey.configuration.api_token).to eq(token)
      SurveyMonkey.reset
      expect { SurveyMonkey.configuration.api_secret }.to raise_error(SurveyMonkey::ConfigurationError)
      expect { SurveyMonkey.configuration.api_token }.to raise_error(SurveyMonkey::ConfigurationError)
    end
  end
end
