<?php
function displayOddNumbers($array)
{
    foreach ($array as $number) {
        if ($number % 2 != 0) {
            echo $number . " ";
        }
    }
}

$numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

echo "奇数: ";
displayOddNumbers($numbers);
