# syntax = docker/dockerfile:1.0-experimental

FROM ekultails/steamos:latest
#FROM archlinux:latest
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm git cmake gcc ninja nasm base-devel linux-headers gtk3 libsecret libgcrypt systemd freeglut zip libpulse unzip glu

RUN git clone --recursive https://github.com/cemu-project/Cemu.git
WORKDIR /Cemu
RUN git checkout tags/v2.0-2

RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=release -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -G Ninja -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja
RUN cmake --build build