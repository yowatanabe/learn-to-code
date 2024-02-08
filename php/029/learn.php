<?php
function factorial($n)
{
    if ($n === 0) {
        return 1;
    } else {
        return $n * factorial($n - 1);
    }
}

$number = 4;

if ($number < 0) {
    echo "数値は整数でなければなりません。\n";
} else {
    echo "{$number}の階乗は" . factorial($number) . "です。\n";
}
