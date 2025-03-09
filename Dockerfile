FROM --platform=amd64 ubuntu:latest

RUN apt-get update

# essential packages
RUN apt-get install \
    file \
    wget \
    strace \
    ltrace \
    python3 \
    python3-pip \
    python3-dev \
    ipython3 \
    gdb \
    socat \
    git \
    netcat-traditional \
    net-tools \
    iputils-ping \
    libffi-dev \
    libssl-dev \
    build-essential \
    zsh \
    patchelf \
    xxd \
    vim \
    nano \
    -y --fix-missing&& \
    rm -rf /var/lib/apt/list/*

RUN pip install --upgrade pwntools --break-system-packages
RUN pip install --upgrade flare-floss --break-system-packages

RUN zsh -c "$(wget https://gef.blah.cat/sh -O -)"
RUN echo "export LC_CTYPE=C.UTF-8" >> ~/.zshenv

RUN zsh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /box
