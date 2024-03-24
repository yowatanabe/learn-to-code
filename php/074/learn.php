<?php

function sumOfSquareRoots($numbers)
{
    $sum = 0;
    foreach ($numbers as $number) {
        $sum += sqrt($number);
    }
    return $sum;
}

// テスト用の数値リスト
$numbers = [4, 9, 16, 25];

// 関数を呼び出して結果を表示
$total = sumOfSquareRoots($numbers);
echo "合計: " . $total . "\n";
