# Docker Image for Raspberry Pi Pico development

[![License](https://img.shields.io/badge/License-MIT-purple.svg)](LICENSE)

# CI Dashboard

[![CIStatus](https://img.shields.io/github/workflow/status/bkozdras/docker-rpi-pico-build-env/docker-rpi-pico-build-env-ci?label=CI%20Status)](CISTATUS)

[![JobBuildDockerImage](https://img.shields.io/badge/Job-Build--Docker--Image-lightgrey)](JOBBUILDOCKERIMAGE)
![badgeBuildDockerImage](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bkozdras/6b1982a4b959b8684caa029b3414819f/raw/badgeBuildDockerImage.json?service=github)

# What this image contains?

- GCC 10
- G++ 10
- Make
- Ninja
- CMake
- GCC ARM none-eabi
- STD C++ ARM none-eabi
- LCov
- Python3-pip
- Doxygen
- Vim
- Git
- Raspberry Pi Pico SDK 1.3.0
- Raspberry Pi Pico Extras 1.3.0
- Valgrind

It is enough to use the docker image as for example in CI workflow on github. You can also use it to build your own projects locally inside of the running image.

# How to deal with it?

It assumes that you are using Unix OS (e.g. Ubuntu, Debian, ...) with possibility to execute bash scripts.

Build docker image named: nemuuser/avr-build-env with tag: latest.
```sh
bash buildImage.sh
```

After successfull build you can run image and connect to the terminal.
```sh
bash runImage.sh
cd workspace
```
As workspace the parent directory of this repo is taken.

Enjoy!
