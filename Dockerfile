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
    && apt-get autoremove -y

ENV RASPBERRY_PI_PICO_BUILD_ENVIRONMENT_CONTAINER=1
