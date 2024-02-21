<?php

$min = (int) readline("最小値を入力してください: ");
$max = (int) readline("最大値を入力してください: ");

$randomNumber = rand($min, $max);

if ($randomNumber % 2 == 0) {
    echo "$randomNumber は偶数です。\n";
} else {
    echo "$randomNumber は奇数です。\n";
}
