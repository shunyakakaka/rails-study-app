FROM ruby:2.5

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                       postgresql-client

RUN mkdir /rails-study-app
WORKDIR /rails-study-app

COPY Gemfile /rails-study-app/Gemfile
COPY Gemfile.lock /rails-study-app/Gemfile.lock

RUN bundle install
#ホストからコンテナにコピー（ホスト側は相対パス）
COPY . /rails-study-app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

#ソケット接続するのでいらないはず
#EXPOSE 3000

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets