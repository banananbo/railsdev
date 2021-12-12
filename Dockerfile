# Node.js用
FROM ruby:2.6.6 AS nodejs

WORKDIR /tmp

# Node.js DL
RUN curl -LO https://nodejs.org/dist/v12.14.1/node-v12.14.1-linux-x64.tar.xz
RUN tar xvf node-v12.14.1-linux-x64.tar.xz
RUN mv node-v12.14.1-linux-x64 node

# Rails用
FROM ruby:2.6.6

# copy nodejs
COPY --from=nodejs /tmp/node /opt/node
ENV PATH  /opt/node/bin:$PATH

# yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH

RUN gem install bundler

WORKDIR /app

RUN bundle config set path vendor/bundle
RUN gem update --system
RUN gem install rails -v 6.0.3

RUN apt-get update -qq
RUN apt install default-mysql-client-core/oldstable

CMD ["bash"]