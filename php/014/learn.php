<?php
function getInput($message)
{
    echo $message;
    return trim(fgets(STDIN));
}

function calculateLCM($a, $b)
{
    $gcd = calculateGCD($a, $b);
    return abs($a * $b) / $gcd;
}

function calculateGCD($a, $b)
{
    while ($b !== 0) {
        $remainder = $a % $b;
        $a = $b;
        $b = $remainder;
    }
    return $a;
}

$num1 = getInput("1つ目の数値を入力してください: ");
$num2 = getInput("2つ目の数値を入力してください: ");

$lcm = calculateLCM($num1, $num2);

echo "最小公倍数: $lcm\n";
