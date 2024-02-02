<?php
function sumIntegers($array)
{
    $sum = 0;
    foreach ($array as $element) {
        if (is_numeric($element)) {
            $sum += $element;
        }
    }
    return $sum;
}

$array = [1, 2, "three", 4, "five", 6];

echo "配列内の整数の合計は: " . sumIntegers($array) . "\n";
