#!/bin/bash
clear
# Declare explicitly (optional but good practice)
declare -a my_array
echo 
echo "This array has just been declared but not defined: ${my_array[@]}"
# Define inline
my_array=(foo bar baz)
echo 
echo "Now the array has been defined: ${my_array[@]}"
echo
echo "Notice how, if I just echo 'my_array', I only get the first element: ${my_array}"
echo
# Define element by element
my_array[0]="newFoo"
my_array[1]="newBar"
echo 
echo "I edited some elements: ${my_array[@]}"
# Accessing elements
echo 
echo "Now I'll access some elements:"
echo "    -> my_array[0] = ${my_array[0]}"
echo "    -> my_array[-1] = ${my_array[-1]}"
echo "    -> my_array[@] = ${my_array[@]}"
echo "    -> #my_array[@] = ${#my_array[@]}"
echo "    -> my_array[@]:1:2 = ${my_array[@]:1:2}"
# Appending
my_array+=("qux")
my_array+=("a" "b")
echo 
echo "I appended some elements: ${my_array[@]}"
# Removing with unset
unset "my_array[1]"
echo 
echo "I removed an element with unset: ${my_array[@]}"
echo "    -> Length is now: ${#my_array[@]} -> this is because # operator skips empty elements, but look:"
echo "    -> my_array[1] = '${my_array[1]}' <- Empty — the hole"
echo "    -> my_array[2] = '${my_array[2]}' <- baz is still at index 2, not 1"
# Clean removal by rebuilding the array
idx=1
my_array=("${my_array[@]:0:$idx}" "${my_array[@]:$((idx+1))}")
echo 
echo "Now I removed it properly: ${my_array[@]}"
echo "    -> Length is now: ${#my_array[@]}"
echo "    -> my_array[1] = '${my_array[1]}' <- Expected result"
echo "    -> my_array[2] = '${my_array[2]}' <- Expected result"
# Iterating
echo 
echo "Iterating through items:"
for item in "${my_array[@]}"; do
    echo "   -> $item"
done
# Check if a value exists
echo 
echo "Is 'bar' in my array?"
for item in "${my_array[@]}"; do
    [[ "$item" == "bar" ]] && echo "    -> found it!" && break
done
echo "Is 'baz' in my array?"
for item in "${my_array[@]}"; do
    [[ "$item" == "baz" ]] && echo "    -> found it!" && break
done
# Copying an array
copy=("${my_array[@]}")
echo 
echo "This is a copy of my array: ${copy[@]}"


echo
echo "─── Getting indices ──────────────────────────────────────────────────────"
echo
# First introduce a gap so the index behavior is visible
my_array=(alpha beta gamma delta)
unset "my_array[1]"
echo "Array after unsetting index 1: ${my_array[@]}"
echo "    -> Existing indices (!my_array[@]): ${!my_array[@]}"
echo "       Notice how index 1 is missing — the gap is reflected in the indices"


echo
echo "─── Iterating with index ─────────────────────────────────────────────────"
echo
echo "Iterating with index over the gapped array:"
for i in "${!my_array[@]}"; do
    echo "   -> my_array[$i] = ${my_array[$i]}"
done
echo "   Notice how index 1 is skipped — this is why iterating with"
echo "   a plain counter (i=0,1,2...) would be unreliable after an unset"


echo
echo "─── Emptying an array ────────────────────────────────────────────────────"
echo
my_array=(alpha beta gamma)
echo "Array before emptying: ${my_array[@]}"
my_array=()
echo "After my_array=()   : '${my_array[@]}' <- empty, variable still exists"
echo "    -> Length: ${#my_array[@]}"
my_array=(alpha beta gamma)
unset my_array
echo "After unset my_array : '${my_array[@]}' <- also empty, variable is gone"
echo "    -> Length: ${#my_array[@]}"
echo "   Both produce the same visible result, but my_array=() is preferred"
echo "   when you intend to reuse the variable afterwards"


echo
echo "─── Checking if an array is empty ───────────────────────────────────────"
echo
my_array=()
echo "Array: '${my_array[@]}'"
if [ ${#my_array[@]} -eq 0 ]; then
    echo "    -> Array is empty"
fi
my_array=(foo bar)
echo "Array: '${my_array[@]}'"
if [ ${#my_array[@]} -eq 0 ]; then
    echo "    -> Array is empty"
else
    echo "    -> Array is not empty"
fi


echo
echo "─── @ vs * ───────────────────────────────────────────────────────────────"
echo
my_array=("hello world" "foo bar")
echo "Array has 2 elements: '${my_array[0]}' and '${my_array[1]}'"
echo
echo "Iterating with \"\${my_array[@]}\" (correct — each element is a separate word):"
for item in "${my_array[@]}"; do
    echo "   -> '$item'"
done
echo
echo "Iterating with \"\${my_array[*]}\" (all elements joined into one string):"
for item in "${my_array[*]}"; do
    echo "   -> '$item'"
done
echo
echo "Iterating with \${my_array[@]} unquoted (spaces split elements — wrong):"
for item in ${my_array[@]}; do
    echo "   -> '$item'"
done
echo "   Notice how 'hello world' and 'foo bar' got split into 4 separate words"
echo