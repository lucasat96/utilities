# Bash data structures

## Indexed arrays
Indexed arrays are mostly like python lists: ordered, can be repeated, one-dimensional

The main rough edges compared to Python lists:

- No built-in `pop`, `index`, `remove`, or `in` operator — you implement those yourself
- `unset` leaves index gaps, so `${#my_array[@]}` (length) can mislead you if you've done removals without rebuilding
Always quote `"${my_array[@]}"` with double quotes — without them, elements with spaces will be split

For basic operations, see [indexed_arrays.bash](./indexed_arrays.bash)
