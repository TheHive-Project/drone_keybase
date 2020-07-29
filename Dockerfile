FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

RUN \
    # Install dependencies
    apt update                                                              && \
    apt install -y -q curl                                                  && \

    # Install keybase
    curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb      && \
    apt install -y -q ./keybase_amd64.deb                                   && \

    # Create group, user
  	groupadd -g 1000 keybase                                                && \
  	useradd --create-home -g keybase -u 1000 keybase

USER keybase

RUN run_keybase
