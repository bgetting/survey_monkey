# frozen_string_literal: true

require_relative "lib/survey_monkey/version"

Gem::Specification.new do |spec|
  spec.name          = "survey_monkey"
  spec.version       = SurveyMonkey::VERSION
  spec.authors       = ["Brian Getting"]
  spec.email         = ["brian@tatem.ae"]

  spec.summary       = "A very thin wrapper for interacting with the SurveyMonkey API."
  spec.description   = "A very thin wrapper for interacting with the SurveyMonkey API. Returns a hash of the API response, and provides messaging when errors are returned."
  spec.homepage      = "https://github.com/bgetting/survey_monkey"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bgetting/survey_monkey"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport", "~> 6"
  spec.add_dependency "httparty", "~> 0.2"
  spec.add_development_dependency "pry", "~> 0.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "webmock", "~> 3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
