# base image: 需要和Orin的l4t版本号保持一致
FROM orin_nav:20230822
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"] 

# install prerequisites for orb_slam3
RUN mkdir /tmp/ && chmod 777 /tmp/
RUN apt-get update && apt-get install -y --no-install-recommends \
 	ros-noetic-costmap-2d \
	ros-noetic-grid-map

#clean up
RUN rm -rf /var/lib/apt/lists/* && apt-get clean

# Entry Point 
WORKDIR /usr/src/app

