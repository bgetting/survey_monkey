# frozen_string_literal: true

RSpec.describe SurveyMonkey::Base do
  describe '#handle_error' do
    subject { described_class.handle_error(error: error_response, headers: headers) }
    [
      [400, 'BadRequestError'],
      [401, 'AuthorizationError'],
      [403, 'PermissionError'],
      [404, 'NotFoundError'],
      [409, 'ResourceConflictError'],
      [410, 'UserDeletedError'],
      [413, 'EntityTooLargeError'],
      [429, 'RateLimitReachedError'],
      [500, 'InternalServerError'],
      [503, 'InternalServerError'],
      [505, 'BadGatewayError']
    ].each do |status|
      context "when HTTP status is #{status[0]}" do
        let(:error_response) do
          { 
            docs: 'http://developer.surveymonkey.com/api/v3/#error-codes',
            http_status_code: status[0],
            message: 'Oh bananas! We couldn\'t process your request.'
          }
        end
        let(:headers) do
          { 
            'content-type' => ['application/json'],
            'x-ratelimit-app-global-minute-limit' => ['120']
          }
        end
        let(:exception) { "SurveyMonkey::#{status[1]}".constantize }
  
        it "raises SurveyMonkey::#{status[1]}" do
          expect { subject }.to raise_error { |error|
            expect(error).to be_a(exception)
            expect(error.docs).to eq(error_response[:docs])
            expect(error.headers).to eq(headers)
            expect(error.headers['x-ratelimit-app-global-minute-limit']).to eq(['120'])
            expect(error.message).to eq(error_response[:message])
          }
        end
      end
    end
  end

  describe '#request' do
    subject { described_class.request(method: method, path: path, options: options) }

    let(:method) { :get }
    let(:options) { {} }
    let(:path) { '/fake-path' }

    context 'when API token is configured' do
      let(:api_token) { 'FAKE-TOKEN' }
      let(:response) { double('response') }
      let(:url) { "https://api.surveymonkey.com/v3#{path}" }
      let(:payload) do
        { title: 'Fake API response' }
      end
      let(:req_headers) do
        {
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization': "Bearer #{api_token}",
          'Content-Type': 'application/json',
          'User-Agent': 'Ruby'
        }
      end
      let(:resp_headers) do
        { 
          'content-type': ['application/json'],
          'x-ratelimit-app-global-minute-limit': ['120']
        }
      end

      before do
        stub_request(:get, url).
          with(headers: req_headers).
          to_return(status: 200, body: payload.to_json, headers: resp_headers)
        SurveyMonkey.configure do |config|
          config.api_token = api_token
        end
      end

      after do
        SurveyMonkey.configure do |config|
          config.api_token = nil
        end
      end

      context 'when response has no error' do
        it 'returns the API response' do
          expect(subject).to eq(payload)
        end
      end
  
      context 'when response has an error' do
        let(:payload) do
          {
            error: {
              docs: 'http://developer.surveymonkey.com/api/v3/#error-codes',
              headers: resp_headers,
              message: 'Oh bananas! We couldn\'t process your request.',
              id: '1050',
              name: 'Internal Server Error',
              http_status_code: 500
            }
          }
        end
  
        it 'calls #handle_error' do
          expect(SurveyMonkey::Base).to receive(:handle_error).with(error: payload[:error], headers: resp_headers.stringify_keys)
          subject
        end
      end
  
      context 'when options are passed' do
        let(:options) do
          { query: { title: 'Test' } }
        end
        let(:url) { "https://api.surveymonkey.com/v3#{path}?title=Test" }
  
        it 'includes options in the request' do
          expect(subject).to eq(payload)
        end
      end
    end

    context 'when API token is not configured' do
      before do
        SurveyMonkey.configure do |config|
          config.api_token = nil
        end
      end

      it 'raises a ConfigurationError' do
        expect { subject }.to raise_error(SurveyMonkey::ConfigurationError)
      end
    end
  end
end
