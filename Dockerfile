FROM ruby:2.5-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh build-base gcc bash cmake

RUN gem install jekyll

EXPOSE 4000

RUN git --version

COPY ./docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN mkdir -p /usr/src/site
WORKDIR /usr/src/site
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh", "-c", "bundle exec jekyll serve --incremental --host 0.0.0.0 --port 4000"]
