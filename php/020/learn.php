<?php
function findMinMax($numbers)
{
    $min = $numbers[0];
    $max = $numbers[0];

    foreach ($numbers as $number) {
        if ($number < $min) {
            $min = $number;
        }
        if ($number > $max) {
            $max = $number;
        }
    }

    return ['min' => $min, 'max' => $max];
}

$numbers = [3, 7, 2, 9, 1, 5];

$result = findMinMax($numbers);
echo "最小値: " . $result['min'] . "\n";
echo "最大値: " . $result['max'] . "\n";
