FROM ruby:2.6.0

RUN git clone https://github.com/docker-hy/rails-example-project /usr/local/rails

WORKDIR /usr/local/rails

RUN apt-get update && apt-get install -y nodejs 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs
RUN npm install yarn -g
RUN gem install bundler
RUN bundle install

RUN rails db:migrate && rake assets:precompile

ENV SECRET_KEY_BASE 1234
ENV RAILS_MASTER_KEY 1234

EXPOSE 3000

CMD rails s