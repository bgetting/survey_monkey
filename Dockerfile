FROM ruby:3-alpine

# Install dependencies
RUN apk update && apk add -q\
  alpine-sdk \
  git \
  less \
  ruby-irb \
  util-linux \
  && rm -rf /var/lib/apt/lists/*

# Set the gem location
ENV GEM_HOME /gem
RUN mkdir $GEM_HOME
WORKDIR $GEM_HOME

# Install bundler
RUN gem install bundler

# Copy gem files
ADD . $GEM_HOME

# Install gems
RUN bundle install
