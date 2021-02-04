FROM ruby:2.6.3

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# 作業ディレクトリの作成、設定
RUN mkdir /like-app

#作業ディレクトリを指定している
WORKDIR /like-app

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは別途事前に作成しておく）
COPY ./Gemfile /like-app/Gemfile
COPY ./Gemfile.lock /like-app/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
COPY . /like-app