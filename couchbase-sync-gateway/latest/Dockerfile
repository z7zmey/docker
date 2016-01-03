FROM debian:jessie

MAINTAINER Vadim Slizov <z7zmey@gmail.com>

# install
RUN apt-get update && \
    apt-get install -y wget

RUN wget -q http://packages.couchbase.com/releases/couchbase-sync-gateway/1.1.1/couchbase-sync-gateway-community_1.1.1-10_x86_64.deb -O package.deb && \
    dpkg -i package.deb && \
    rm package.deb

## clean
RUN apt-get purge wget -y \
    && apt-get autoremove -yqq \
    && apt-get clean

# configure
ENV PATH /opt/couchbase-sync-gateway/bin:$PATH

EXPOSE 4984 4985

COPY ./config.json /config.json

CMD ["sync_gateway", "/config.json"]
