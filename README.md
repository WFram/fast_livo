# FAST-LIVO

This repository contains [FAST-LIVO](https://github.com/hku-mars/FAST-LIVO) Dockerized package.

## Installation

Host:
```
git submodule update --init
bash docker_build.sh
xhost local:docker
bash docker_run.sh /path/to/catkin/workspace
```

Inside a container:
```
bash configure_ws.sh
catkin build
source /opt/ros/noetic/setup.bash
source devel/setup.bash
```