#!/bin/bash
echo "ROS_HOSTNAME: $ROS_HOSTNAME"
echo "ROS_MASTER: $ROS_MASTER_URI"
source /opt/ros/noetic/setup.bash

# 导航相机建图
cd ./lunar_ws/src/lunar_mapping/lunar_mapping
./global_mapping > $LOG_PATH/global_mapping.log &

# 避障相机建图
./local_mapping > $LOG_PATH/local_mapping.log &

# 高程图
source /usr/src/app/lunar_ws/devel/setup.bash
roslaunch elevation_mapping lunar_grid_mapping.launch 1> $LOG_PATH/map_grid.log 2> /dev/null