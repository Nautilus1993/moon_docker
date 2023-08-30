#!/bin/bash
echo "ROS_HOSTNAME: $ROS_HOSTNAME"
echo "ROS_MASTER: $ROS_MASTER_URI"
echo "LOG_PATH: $LOG_PATH"

# 编译
catkin_make -DCMAKE_BUILD_TYPE=RELEASE

# 运行
source ./devel/setup.bash
roslaunch grid_map_demos test_corners.launch 1> $LOG_PATH/path_planning.log 2> /dev/null