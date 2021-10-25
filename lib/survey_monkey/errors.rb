# frozen_string_literal: true

module SurveyMonkey
  class AuthorizationError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class BadGatewayError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class BadRequestError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class EntityTooLargeError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class InternalServerError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class NotFoundError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class PermissionError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class RateLimitReachedError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class ResourceConflictError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end

  class UserDeletedError < StandardError
    def initialize(message, docs)
      @docs = docs
      super(message)
    end
  end
end
