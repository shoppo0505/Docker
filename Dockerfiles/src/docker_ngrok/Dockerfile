FROM alpine

RUN mkdir /app

ENV PATH /app:$PATH

COPY docker-entrypoint.sh /app/docker-entrypoint.sh
COPY cpolar /app/cpolar

WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]
