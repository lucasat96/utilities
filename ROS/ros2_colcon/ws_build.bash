#!/bin/bash

colcon build --symlink-install --packages-ignore <IGNORE_PACKAGES> --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

source ./install/setup.bash