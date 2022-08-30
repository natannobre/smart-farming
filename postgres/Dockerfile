FROM postgres:12

RUN apt-get update && apt-get install -y curl

RUN curl https://cli-assets.heroku.com/install.sh | sh

RUN mkdir /postgres

WORKDIR /postgres