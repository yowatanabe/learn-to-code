<?php

function generateAndCheckNumber($min, $max)
{
    $randomNumber = rand($min, $max);

    if ($randomNumber % 2 === 0) {
        return "$randomNumber は偶数です";
    } else {
        return "$randomNumber は奇数です";
    }
}

echo "1から10までの範囲の乱数を生成して偶数か奇数かを判定します。\n";
echo generateAndCheckNumber(1, 10) . "\n";
echo "100から200までの範囲の乱数を生成して偶数か奇数かを判定します。\n";
echo generateAndCheckNumber(100, 200) . "\n";
echo "-50から50までの範囲の乱数を生成して偶数か奇数かを判定します。\n";
echo generateAndCheckNumber(-50, 50) . "\n";
