FROM ubuntu:24.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    curl \
    git \
    vim \
    wget \
    unzip \
    gpg

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install brew
RUN /bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
RUN apt-get install build-essential -y
RUN brew install gcc helm kubectl k9s mise

# Configure MISE
RUN echo 'eval "$(mise activate bash)"' >> ~/.bashrc
RUN mise use -g -y terraform@latest terragrunt@latest

CMD [ "bash" ]