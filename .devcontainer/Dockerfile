FROM mcr.microsoft.com/devcontainers/base:ubuntu

COPY ./setup.sh /tmp/setup.sh

RUN sudo chmod +x /tmp/setup.sh \
    && bash ./tmp/setup.sh \
    && rm -rf /tmp/setup.sh

ARG USERNAME=root
USER $USERNAME