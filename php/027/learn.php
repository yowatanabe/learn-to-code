<?php
function calculateAverage($numbers)
{
    $sum = array_sum($numbers);
    $count = count($numbers);

    if ($count > 0) {
        $average = $sum / $count;
        return $average;
    } else {
        return 0;
    }
}

$numbers = [10, 20, 30, 40, 50];

echo "配列の平均値は: " . calculateAverage($numbers) . "\n";
