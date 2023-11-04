catkin init \
    && catkin config --extend /opt/ros/noetic \
    && catkin config --merge-devel \
    && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release