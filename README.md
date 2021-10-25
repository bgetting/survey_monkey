# SurveyMonkey

A very thin wrapper around the [Survey Monkey APi (v3)](https://developer.surveymonkey.com/api/v3/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'survey_monkey'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install survey_monkey

## Configuration
API keys must be configured in the gem setup. You can do this anywhere in your application before you make API calls using the gem.

```ruby
# config/initializers/survey_monkey.rb
SurveyMonkey.configure do |config|
  config.api_secret = ENV['SURVEY_MONKEY_API_SECRET']
  config.api_token = ENV['SURVEY_MONKEY_API_TOKEN']
end
```

## Usage

Expects an `ENV` variable called `SURVEY_MONKEY_API_TOKEN` that is a valid API access token for the Survey Monkey API. [Take a look at each resource](https://github.com/bgetting/survey_monkey/tree/main/lib/survey_monkey) to see the methods that correspond to the endpoints in the [Survey Monkey documentation](https://developer.surveymonkey.com/api/v3/).

```ruby
surveys = SurveyMonkey::Survey.all
webhook = SurveyMonkey::Webhook.create({
  name: 'Test Webhook',
  event_type: 'response_completed',
  object_type: 'survey',
  object_ids: [ '1234', '5678' ],
  subscription_url: 'https://mywebhookreceiver.com'
})

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

If you are using Docker build a container with `docker-compose build`. After that run `docker-compose run --rm ruby sh` to start an interactive shell where you can run commands like `bin/rspec`, etc.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bgetting/survey_monkey.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
