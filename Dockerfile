FROM ruby:2.5.3
ENV LANG C.UTF-8
ENV APP_ROOT /rails-ec2-deploy

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p $APP_ROOT

WORKDIR $APP_ROOT
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock

RUN bundle install

COPY . $APP_ROOT

EXPOSE 3000
