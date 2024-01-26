<?php
function getInput($message)
{
    echo $message;
    return trim(fgets(STDIN));
}

$num1 = getInput("1つ目の整数を入力してください: ");
$num2 = getInput("2つ目の整数を入力してください: ");

$maxNumber = max($num1, $num2);

echo "大きい方の数: $maxNumber\n";
