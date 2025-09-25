# ROS2 colcon utilities

This folder contains simple Bash utilities to help manage ROS2 workspaces built with `colcon`.

## Scripts

### ws_build.bash
Builds the workspace using `colcon build` with common options:
- Ignores packages specified in `<IGNORE_PACKAGES>`
- Enables symlink install
- Exports compile commands for CMake
- Sources the workspace after building

**Usage:**
```bash
./ws_build.bash
```

### easy_source.bash
Sources the workspace's `install/setup.bash` file for easy environment setup.

**Usage:**
```bash
source easy_source.bash
```

### clean_build.bash
Removes the `build`, `install`, and `log` directories, then rebuilds the workspace by calling `ws_build.bash`.

**Usage:**
```bash
./clean_build.bash
```

---

These scripts are intended to be run from the root of your ROS2 workspace. Adjust paths as needed for your setup.

## Further Reading

For the full `colcon build` documentation, see:
https://docs.ros.org/en/humble/Tutorials/Beginner-Client-Libraries/Colcon-Tutorial.html

