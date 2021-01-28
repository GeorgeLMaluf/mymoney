FROM ruby:2.7.2
RUN apt-get update -qq \
    && apt-get install -y \
    build-essential postgresql-client libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /app

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0'
