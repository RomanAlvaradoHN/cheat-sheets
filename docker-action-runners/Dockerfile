# base
FROM ubuntu:24.04

# set the github runner version
ARG RUNNER_VERSION="2.337.0"
ENV DEBIAN_FRONTEND=noninteractive


# add docker user and install sudo
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends sudo \
    && useradd -m docker \
    && echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/docker \
    && chmod 0400 /etc/sudoers.d/docker

# install dependencies
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev \
    python3 python3-venv python3-dev python3-pip \
    lsb-release unzip git ca-certificates gnupg \
    libgbm-dev libgtk-3-0 libxss1 libasound2t64 xvfb \
    fonts-noto-color-emoji libcaca0 \
    libgstreamer-plugins-good1.0-0 \
    gstreamer1.0-plugins-good \
    && rm -rf /var/lib/apt/lists/*

# install Node.js v24 (LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI v2
RUN curl -fsSL https://awscli.amazonaws.com/v2/install.sh | bash -s -- --system

# cd into the user directory, download and unzip the github actions runner
RUN cd /home/docker && mkdir action-runner && cd action-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# install some additional dependencies
RUN chown -R docker ~docker && /home/docker/action-runner/bin/installdependencies.sh

# copy over the start-action-runner.sh script
COPY start-action-runner.sh start-action-runner.sh

# make the script executable
RUN chmod +x start-action-runner.sh

# since the config and run script for actions are not allowed to be run by root,
# set the user to "docker" so all subsequent commands are run as the docker user
USER docker

# set the entrypoint to the start.sh script
ENTRYPOINT ["./start-action-runner.sh"]