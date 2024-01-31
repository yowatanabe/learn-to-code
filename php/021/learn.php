<?php
function filterEvenNumbers($numbers)
{
    $evenNumbers = array();

    foreach ($numbers as $number) {
        if ($number % 2 == 0) {
            $evenNumbers[] = $number;
        }
    }

    return $evenNumbers;
}

$numbers = [3, 8, 2, 9, 12, 5, 6, 10];

$evenNumbers = filterEvenNumbers($numbers);

echo "元の配列: " . implode(", ", $numbers) . "\n";
echo "偶数のみの配列: " . implode(", ", $evenNumbers) . "\n";
