FROM ruby:2.2.4
RUN apt-get update -qq
RUN apt-get install -y build-essential nodejs libmysqlclient-dev

RUN mkdir -p /app/user
WORKDIR /app/user
ENV GEM_PATH /app/ruby/bundle/ruby/2.2.4
ENV GEM_HOME /app/ruby/bundle/ruby/2.2.4
RUN mkdir -p /app/ruby/bundle/ruby/2.2.4

# Install Rake
RUN gem install rake
# Install Bundler
RUN gem install bundler -v 1.11.2 --no-ri --no-rdoc
ENV PATH /app/user/bin:/app/ruby/bundle/ruby/2.2.4/bin:$PATH
ENV BUNDLE_APP_CONFIG /app/ruby/.bundle/config

# Run bundler to cache dependencies
COPY ["Gemfile","Gemfile.lock", "/app/user/"]
# ADD Gemfile Gemfile
# ADD Gemfile.lock Gemfile.lock
RUN bundle install --path /app/ruby/bundle --jobs 4
# Everything up to here was cached. This includes
# the bundle install, unless the Gemfiles changed.
# Now copy the app into the image.
ADD . /app/user

# ENV RAILS_ENV production
ENV RAILS_ENV development

# export env vars during run time
RUN mkdir -p /app/.profile.d/
RUN echo "cd /app/user/" > /app/.profile.d/home.sh
RUN echo "export PATH=\"$PATH\" GEM_PATH=\"$GEM_PATH\" GEM_HOME=\"$GEM_HOME\" RAILS_ENV=\"\${RAILS_ENV:-$RAILS_ENV}\" BUNDLE_APP_CONFIG=\"$BUNDLE_APP_CONFIG\"" > /app/.profile.d/ruby.sh

COPY ./bin/init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh
RUN /usr/bin/init.sh
RUN rm -f /tmp/pids/server.pid
CMD rails s -b 0.0.0.0
