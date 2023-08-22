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

COPY ./opencv-4.4.0.zip ./opencv_contrib-4.4.0.zip ./eigen-3.3.8.zip ./Pangolin.zip  $TMP_FOLDER
RUN unzip '/tmp/*.zip' -d $TMP_FOLDER

# install opencv
RUN cd $TMP_FOLDER/opencv-4.4.0/build \
    && cmake \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/opt/opencv \
        -D INSTALL_C_EXAMPLES=ON \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.4.0/modules \
        -D BUILD_EXAMPLES=ON .. \
    && make -j $CORE_NUMBER \
    && make install
RUN cd $TMP_FOLDER/opencv-4.4.0/build \
    && cmake \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/opt/opencv \
        -D INSTALL_C_EXAMPLES=ON \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.4.0/modules \
        -D BUILD_EXAMPLES=ON .. \
    && make -j $CORE_NUMBER \
    && make install


# install Eigen 
# RUN cd $TMP_FOLDER/eigen-3.3.8 \
#     && mkdir build && cd build \
#     && cmake .. \
#     && make -j $CORE_NUMBER \
#     && make install

# install Pangolin
 RUN cd $TMP_FOLDER/Pangolin \
    && mkdir build && cd build \
    && cmake .. \
    && make -j $CORE_NUMBER \
    && make install

# install slam
# RUN cd $TMP_FOLDER/ORB_SLAM3 && ./build.sh    

#clean up
RUN rm -rf $TMP_FOLDER \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Entry Point 
WORKDIR /usr/src/app

