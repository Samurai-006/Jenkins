FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    libssl-dev \
    wget \
    python3 \
    python3-pip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
RUN git clone https://openmodelica.org/git-readonly/OpenModelica.git OpenModelica-minimal
RUN git clone https://github.com/modelon-community/SEMLA.git
WORKDIR /opt/SEMLA/src
RUN mkdir build && cd build && \
    cmake .. && \
    make

ENV PATH="/opt/SEMLA/src/build:${PATH}"
WORKDIR /workspace
