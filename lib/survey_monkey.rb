# frozen_string_literal: true

require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/string/inflections'
require 'httparty'
require 'json'

require 'survey_monkey/configuration'
require 'survey_monkey/base'
require 'survey_monkey/benchmark_bundle'
require 'survey_monkey/category'
require 'survey_monkey/collector'
require 'survey_monkey/contact'
require 'survey_monkey/contact_field'
require 'survey_monkey/contact_list'
require 'survey_monkey/errors'
require 'survey_monkey/folder'
require 'survey_monkey/group'
require 'survey_monkey/language'
require 'survey_monkey/message'
require 'survey_monkey/page'
require 'survey_monkey/question'
require 'survey_monkey/question_bank'
require 'survey_monkey/response'
require 'survey_monkey/survey'
require 'survey_monkey/template'
require 'survey_monkey/user'
require 'survey_monkey/version'
require 'survey_monkey/webhook'
require 'survey_monkey/workgroup'

module SurveyMonkey
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
