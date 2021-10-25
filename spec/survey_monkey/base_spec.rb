# frozen_string_literal: true

RSpec.describe SurveyMonkey::Base do
  describe '#handle_error' do
    subject { described_class.handle_error(error: error) }
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
        let(:error) { { http_status_code: status[0] } }
        let(:exception) { "SurveyMonkey::#{status[1]}".constantize }
  
        it "raises SurveyMonkey::#{status[1]}" do
          expect { subject }.to raise_error(exception)
        end
      end
    end
  end

  describe '#request' do
    subject { described_class.request(method: method, path: path, options: options) }

    let(:method) { :get }
    let(:options) { {} }
    let(:path) { '/fake-path' }
    let(:response) { double('response') }
    let(:url) { "https://api.surveymonkey.com/v3#{path}" }
    let(:payload) do
      { title: 'Fake API response' }
    end
    let(:req_headers) do
      {
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Authorization': 'Bearer FAKE-TOKEN', # Set in docker-compose.yml
        'Content-Type': 'application/json',
        'User-Agent': 'Ruby'
      }
    end
    let(:resp_headers) do
      { 'Content-Type': 'application/json' }
    end
    
    before do
      stub_request(:get, url).
        with(headers: req_headers).
        to_return(status: 200, body: payload.to_json, headers: resp_headers)
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
            message: 'Oh bananas! We couldn\'t process your request.',
            id: '1050',
            name: 'Internal Server Error',
            http_status_code: 500
          }
        }
      end

      it 'calls #handle_error' do
        expect(SurveyMonkey::Base).to receive(:handle_error).with(error: payload[:error])
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
end
