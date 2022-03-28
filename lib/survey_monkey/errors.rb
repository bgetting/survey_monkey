# frozen_string_literal: true

module SurveyMonkey
  class AuthorizationError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class BadGatewayError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class BadRequestError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class ConfigurationError < StandardError; end

  class EntityTooLargeError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class InternalServerError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class NotFoundError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class PermissionError < StandardError
    attr_reader :docs, :headers
    
    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class RateLimitReachedError < StandardError
    attr_reader :docs, :headers

    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class ResourceConflictError < StandardError
    attr_reader :docs, :headers

    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end

  class UserDeletedError < StandardError
    attr_reader :docs, :headers

    def initialize(message, docs, headers)
      @docs = docs
      @headers = headers
      super(message)
    end
  end
end
