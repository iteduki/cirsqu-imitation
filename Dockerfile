FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs mysql-client
RUN mkdir /circle-square-imitation
WORKDIR /circle-square-imitation
COPY Gemfile /circle-square-imitation/Gemfile
COPY Gemfile.lock /circle-square-imitation/Gemfile.lock
RUN bundle install
COPY . /circle-square-imitation

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]