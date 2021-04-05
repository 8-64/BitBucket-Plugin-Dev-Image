FROM atlassian/bitbucket:latest

ARG MY_VERSION=v0.1

LABEL id="bitbucket-plugin-dev"
LABEL version="$MY_VERSION"
LABEL maintainer='Vasyl Kupchenko basilwashere[at]gmail.com'

RUN apt-get update \
    && apt-get -y install wget \
    && apt-get -y install gnupg \
    && wget https://packages.atlassian.com/api/gpg/key/public \
    && apt-key add public \
    && echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install atlassian-plugin-sdk \
    && apt-get -y install maven

ENTRYPOINT ["/bin/bash"]
