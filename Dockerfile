FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /dsp
WORKDIR /dsp
ADD Gemfile /dsp/Gemfile
ADD Gemfile.lock /dsp/Gemfile.lock
RUN bundle install
ADD . /dsp
