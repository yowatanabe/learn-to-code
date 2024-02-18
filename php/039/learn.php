<?php

function calculateSum($numbers)
{
    $sum = 0;

    foreach ($numbers as $number) {
        $sum += $number;
    }

    return $sum;
}

$numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

$evenSum = calculateSum($numbers);

echo "数字のリストの合計: $evenSum\n";
