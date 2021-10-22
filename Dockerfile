FROM ruby:3-alpine

# Install dependencies
RUN apk update && apk add -q\
  alpine-sdk \
  util-linux \
  ruby-irb \
  && rm -rf /var/lib/apt/lists/*

# Set the gem location
ENV GEM_HOME /gem
RUN mkdir $GEM_HOME
WORKDIR $GEM_HOME

# Install gems
RUN gem install bundler
#ADD Gemfile* $APP_HOME/
#RUN bundle install

# Copy gem files
ADD . $GEM_HOME
