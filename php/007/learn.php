<?php
function decimalToBinary($decimal)
{
    return decbin($decimal);
}

echo "10進数の整数を入力してください: ";
$userInput = trim(fgets(STDIN));

if (is_numeric($userInput)) {
    $decimalNumber = intval($userInput);
    $binaryNumber = decimalToBinary($decimalNumber);
    echo "2進数に変換した結果: $binaryNumber\n";
} else {
    echo "有効な整数を入力してください。\n";
}
