<?php
echo "整数を入力してください: ";
$n = trim(fgets(STDIN));

$total = 0;

for ($i = 1; $i <= $n; $i++) {
    if ($i % 3 == 0 || $i % 5 == 0) {
        $total += $i;
    }
}

echo "1から{$n}までの整数の中で、3または5で割り切れる数の合計: {$total}\n";
