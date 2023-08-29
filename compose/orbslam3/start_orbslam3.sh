#!/bin/bash
# 进入工作目录
echo "ROS_HOSTNAME: $ROS_HOSTNAME"
echo "ROS_MASTER: $ROS_MASTER_URI"
echo "LOG_PATH: $LOG_PATH"

# 编译
source /opt/ros/noetic/setup.bash
cd ./catkin_ws
catkin_make
cd ../

# 读取相机内参
source catkin_ws/devel/setup.bash
rosrun tool saveInfo > $LOG_PATH/camera_info.log


# 配置ROS Package 路径
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/usr/src/app/Examples_old/ROS/PANG_SLAM
# source ~/.bashrc

# 导航相机 (当前的目录是 cd ./Examples_old/ROS/PANG_SLAM/)
cd ./Examples_old/ROS/PANG_SLAM/
./run.sh 

# 避障相机(当前的目录是 cd ./Examples_old/ROS/PANG_SLAM/)
# ./Examples_old/ROS/PANG_SLAM/run_avoid.sh