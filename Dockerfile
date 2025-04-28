FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

#Install required packages
RUN apt-get update && apt-get install -y \
    make \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    build-essential \
    && apt-get clean

#set the working directory
WORKDIR /project

#Default command
CMD ["/bin/bash"]