# Printing terminal output in ROS2

Printing to the terminal in ROS2 is typically done using logging macros provided by the rclcpp library, or methods provided by rclpy. These macros provide different log levels and support printf-style formatting codes, which can sometimes be confusing.

## RCLCPP (C++)

### ROS2 Logging Macros (C++)

| Macro                | Log Level   | Description                      |
|----------------------|------------|----------------------------------|
| RCLCPP_DEBUG         | Debug      | Detailed debug information       |
| RCLCPP_INFO          | Info       | General information (default)    |
| RCLCPP_WARN          | Warning    | Warnings                        |
| RCLCPP_ERROR         | Error      | Errors                          |
| RCLCPP_FATAL         | Fatal      | Critical errors, program may exit|

### Usage Example

```cpp
#include <rclcpp/rclcpp.hpp>

int main(int argc, char **argv) {
    rclcpp::init(argc, argv);
    auto node = std::make_shared<rclcpp::Node>("example_node");

    RCLCPP_DEBUG(node->get_logger(), "Debug value: %d", 42);
    RCLCPP_INFO(node->get_logger(), "Hello, ROS2!");
    RCLCPP_WARN(node->get_logger(), "This is a warning!");
    RCLCPP_ERROR(node->get_logger(), "An error occurred: %s", "file not found");
    RCLCPP_FATAL(node->get_logger(), "Fatal error!");

    rclcpp::shutdown();
    return 0;
}
```

### Common printf-style Format Codes

| Code | Meaning           | Example Output |
|------|-------------------|---------------|
| %d   | Integer           | 42            |
| %f   | Floating point    | 3.14          |
| %s   | String            | hello         |
| %c   | Character         | A             |
| %u   | Unsigned int      | 123           |
| %x   | Hexadecimal       | 2a            |
| %p   | Pointer address   | 0x7ffee...    |

For a full list, see the [C++ printf documentation](https://en.cppreference.com/w/cpp/io/c/fprintf).

---

## RCLPY (Python)

### ROS2 Logging Methods (C++)

In Python, ROS2 provides similar logging functionality through the `rclpy` library. The most common logging methods are:

| Method                  | Log Level   | Description                      |
|-------------------------|------------|----------------------------------|
| self.get_logger().debug()   | Debug      | Detailed debug information       |
| self.get_logger().info()    | Info       | General information (default)    |
| self.get_logger().warn()    | Warning    | Warnings                        |
| self.get_logger().error()   | Error      | Errors                          |
| self.get_logger().fatal()   | Fatal      | Critical errors, program may exit|

### Usage Example (Python)

```python
import rclpy
from rclpy.node import Node

class ExampleNode(Node):
    def __init__(self):
        super().__init__('example_node')
        self.get_logger().debug('Debug value: %d' % 42)
        self.get_logger().info('Hello, ROS2!')
        self.get_logger().warn('This is a warning!')
        self.get_logger().error('An error occurred: %s' % 'file not found')
        self.get_logger().fatal('Fatal error!')

rclpy.init()
node = ExampleNode()
rclpy.shutdown()
```

- In Python, you can use standard Python string formatting (e.g., `%d`, `%s`, or f-strings) inside the log message.

## Changing the Log Level

By default, the log level is INFO. To change it, use the `--ros-args --log-level` argument when running your node:

```bash
ros2 run <package> <executable> --ros-args --log-level DEBUG
```

Or, set the log level programmatically.
C++:
```cpp
rclcpp::Logger logger = node->get_logger().set_level(rclcpp::Logger::Level::Debug);
```
Python:
```python
node.get_logger().set_level(rclpy.logging.LoggingSeverity.DEBUG)
```

---

For more details, see the [ROS2 Logging Guide](https://docs.ros.org/en/humble/Tutorials/Demos/Logging-and-logger-configuration.html).

