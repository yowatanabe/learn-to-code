<?php
$numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

$oddSum = 0;
$evenSum = 0;

foreach ($numbers as $number) {
    if ($number % 2 == 0) {
        $evenSum += $number;
    } else {
        $oddSum += $number;
    }
}

echo "奇数の合計: $oddSum\n";
echo "偶数の合計: $evenSum\n";
