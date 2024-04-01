# base image: 需要和Orin的l4t版本号保持一致
FROM nvcr.io/nvidia/l4t-base:r34.1.1
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"] 
ARG CORE_NUMBER=8
ARG TMP_FOLDER=/tmp/

# install prerequisites for orb_slam3
RUN echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ xenial main multiverse restricted universe' >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
	cmake \
        git \
        libgtk2.0-dev \
        pkg-config \
        libswscale-dev \
        libopenexr-dev \
        libgstreamer1.0-dev \
        libgstreamer-plugins-base1.0-dev \
        python-dev-is-python3 \
        python-numpy \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libjasper1 \
        libjasper-dev \
        libdc1394-22-dev \
        unzip \
        curl \
        libglew-dev \
        libboost-dev \
        libboost-thread-dev \
        libboost-filesystem-dev \ 
	libssl-dev \
	iputils-ping \
	net-tools

# install ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update && apt install -y ros-noetic-desktop-full
RUN apt update && apt install -y \
        python3-rosdep \
        python3-rosinstall \
        python3-rosinstall-generator \
        python3-wstool \
	python3-catkin-tools \
        build-essential
RUN rosdep init && rosdep update
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && source ~/.bashrc

#clean up 
RUN rm -rf /var/lib/apt/lists/* && apt-get clean
