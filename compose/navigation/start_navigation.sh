#!/bin/bash
echo "ROS_HOSTNAME: $ROS_HOSTNAME"
echo "ROS_MASTER: $ROS_MASTER_URI"
echo "LOG_PATH: $LOG_PATH"

# 太阳敏感器
./src/navlib/sunsensor_node > /dev/null 2> $LOG_PATH/navigation_error.log &

# IMU
./src/navlib/navcore_node > /dev/null 2> $LOG_PATH/navigation_error.log &

# 查看组合导航结果 
source /opt/ros/noetic/setup.bash
rostopic echo /navlib/odom > $LOG_PATH/navigation_result.log 