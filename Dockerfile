FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    libssl-dev \
    wget \
    python3 \
    python3-pip
    
WORKDIR /opt
RUN git clone https://openmodelica.org/git-readonly/OpenModelica.git OpenModelica-minimal
RUN git clone https://github.com/modelon-community/SEMLA.git
WORKDIR /opt/SEMLA/src

RUN mkdir -p /opt/semla_keys && \
    mkdir -p /opt/semla_public_keys && \

    openssl genrsa -out /opt/semla_keys/private_key_tool.pem 4096 && \

    openssl genrsa -out /opt/semla_keys/private_key_lve.pem 4096 && \

    openssl rsa -pubout \
      -in /opt/semla_keys/private_key_tool.pem \
      -out /opt/semla_public_keys/public_key_tool.pem && \

    echo "public_key_tool.pem" \
      > /opt/semla_public_keys/public_key_tools.txt

RUN mkdir build && cd build && \
    cmake .. \
      -DTOOL_PRIVATE_KEY_DIRECTORY=/opt/semla_keys \
      -DLVE_KEYS_DIRECTORY=/opt/semla_keys \
      -DTOOLS_PUBLIC_KEYS_DIRECTORY=/opt/semla_public_keys \
      -DLICENSE_MANAGER=testingdummy \
      -DDECRYPTOR=default \
      -DOBFUSCATOR=dummy && \
    make

ENV PATH="/opt/SEMLA/src/build:${PATH}"
WORKDIR /workspace
