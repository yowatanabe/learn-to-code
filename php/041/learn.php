<?php

function sumNumbers($array)
{
    $sum = 0;
    foreach ($array as $element) {
        if (is_numeric($element)) {
            $sum += $element;
        }
    }
    return $sum;
}

$numbers = [10, 20, '30', 40, 'abc', 50];

$total = sumNumbers($numbers);
echo "配列内の数値の合計: " . $total . "\n";
