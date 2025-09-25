# ANSI Escape Codes for Terminal Text Colorization

ANSI escape codes allow you to colorize and style terminal text output, and to change the text format in several other ways (see [Other codes](#other-codes)). This is particularly useful for debugging, since it can make terminal messages stand out. Below is a table of common color codes:

| Color         | Code | Full code |
|-------------- |------|:--------:|
| Black         | 30   | \033[30m |
| Red           | 31   | \033[31m |
| Green         | 32   | \033[32m |
| Yellow        | 33   | \033[33m |
| Blue          | 34   | \033[34m |
| Magenta       | 35   | \033[35m |
| Cyan          | 36   | \033[36m |
| White         | 37   | \033[37m |
| Reset         | 0    | \033[0m  |

## Usage Examples

Safest practice is to reset color for each message, if reset code is not added at the end of the text, future printed text will also be colorized.

```
<COLOR_CODE><your_text><RESET_CODE>
```

### Python
```python
# Print colored text in Python
print("\033[31mThis is red text\033[0m")
print("\033[32mThis is green text\033[0m")
```

### C++
```cpp
#include <iostream>

int main() {
    std::cout << "\033[34mThis is blue text\033[0m" << std::endl;
    std::cout << "\033[33mThis is yellow text\033[0m" << std::endl;
    return 0;
}
```

### Bash
```bash
echo -e "\033[35mThis is magenta text\033[0m"
echo -e "\033[36mThis is cyan text\033[0m"
```

## Other codes

- **Bold:** `\033[1m`
- **Italic:** `\033[3m` (may not work in all terminals)
- **Underline:** `\033[4m`
- **Reset all:** `\033[0m`

For more styles and background colors, see [ANSI escape code documentation](https://en.wikipedia.org/wiki/ANSI_escape_code).
