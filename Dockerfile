FROM ruby:2.6

RUN apt-get update -y

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR /app

COPY . $APP_HOME

