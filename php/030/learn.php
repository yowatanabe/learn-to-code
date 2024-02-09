<?php
function reverseArray($arr)
{
    $reversedArray = array_reverse($arr);
    return $reversedArray;
}

$array = [1, 2, 3, 4, 5];

$reversedArray = reverseArray($array);

echo "Original Array: " . implode(", ", $array) . "\n";
echo "Reversed Array: " . implode(", ", $reversedArray) . "\n";
