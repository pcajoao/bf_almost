FROM ruby:3.1.2

ENV RAILS_ROOT /app

RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  patch \
  ruby-dev \
  zlib1g-dev \
  liblzma-dev \
  libxml2 \
  libxml2-dev \
  libxslt1-dev

COPY Gemfile Gemfile.lock ./

RUN gem install bundler



# RUN gem install nokogiri -- --use-system-libraries
RUN bundle config build.nokogiri --use-system-libraries
# RUN bundle config set force_ruby_platform true

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]