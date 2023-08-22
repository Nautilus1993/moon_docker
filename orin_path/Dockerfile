# base image
FROM orin_ros:v1.1
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
ARG CORE_NUMBER=8
ARG TMP_FOLDER=/tmp/

# install ros package
RUN apt-get update && apt-get install -y --no-install-recommends ros-noetic-costmap-2d

COPY ./eigen-3.3.8.zip $TMP_FOLDER
RUN unzip '/tmp/*.zip' -d $TMP_FOLDER

# install Eigen
RUN cd $TMP_FOLDER/eigen-3.3.8 \
    && mkdir build && cd build \
    && cmake .. \
    && make -j $CORE_NUMBER \
    && make install

#clean up
RUN rm -rf $TMP_FOLDER \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

WORKDIR /usr/src/app
