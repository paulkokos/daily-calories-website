FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /daily-calories-website
COPY Gemfile /daily-calories-website/Gemfile
COPY Gemfile.lock /daily-calories-website/Gemfile.lock
RUN bundle install
COPY . /daily-calories-website

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]