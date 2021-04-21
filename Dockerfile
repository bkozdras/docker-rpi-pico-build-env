#**********************************************************************************#
# Copyright by @bkozdras <b.kozdras@gmail.com>                                     #
# Purpose: To build docker image with build system for Raspberry Pi Pico.          #
#          Cross compiling for ARM Cortex M0+ (arm-gcc preparation).               #
# Version: 1.0                                                                     #
# Licence: MIT                                                                     #
#**********************************************************************************#

FROM ubuntu:20.04
MAINTAINER Bartlomiej Kozdras <b.kozdras@gmail.com>
LABEL version="1.0"

USER root
WORKDIR /

ENV GCC_VERSION 10

ENV DEBIAN_FRONTEND "noninteractive"
ENV TZ "Europe/Warsaw"

RUN \
    apt-get update -y                             \
    && apt-get upgrade -y                         \
    && apt-get dist-upgrade -y                    \
    && apt-get install -y                         \
    && apt-get install -y --no-install-recommends \
        gcc-$GCC_VERSION                          \
        g++-$GCC_VERSION                          \
        make                                      \
        ninja-build                               \
        cmake                                     \
        gcc-arm-none-eabi                         \
        libnewlib-arm-none-eabi                   \
        build-essential                           \
        libstdc++-arm-none-eabi-newlib            \
        lcov                                      \
        python3-pip                               \
        doxygen                                   \
        vim                                       \
        git                                       \
    && apt-get autoremove -y

RUN \
    git config --global advice.detachedHead false

ENV PICO_SDK_VERSION 1.1.2
ENV PICO_SDK_EXTRAS_VERSION master

RUN \
    mkdir -p rpi_pico

RUN \
    cd rpi_pico \
    && git clone --depth 1 \
        --branch $PICO_SDK_VERSION https://github.com/raspberrypi/pico-sdk.git \
    && cd pico-sdk \
    && git submodule update --recursive --init \
ENV PICO_SDK_PATH=/rpi_pico/pico-sdk

RUN \
    cd rpi_pico \
    && git clone --depth 1 \
        --branch $PICO_SDK_EXTRAS_VERSION https://github.com/raspberrypi/pico-extras.git \
    && cd pico-extras \
    && git submodule update --force --recursive --init --remote
ENV PICO_EXTRAS_PATH=/rpi_pico/pico-extras

ENV RASPBERRY_PI_PICO_BUILD_ENVIRONMENT_CONTAINER=1
