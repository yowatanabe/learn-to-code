<?php
function isPrime($number)
{
    if ($number <= 1) {
        return false;
    }
    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i == 0) {
            return false;
        }
    }
    return true;
}

echo "数値を入力してください: ";
$input = trim(fgets(STDIN));

if (is_numeric($input)) {
    $number = intval($input);
    if (isPrime($number)) {
        echo "$number は素数です。\n";
    } else {
        echo "$number は素数ではありません。\n";
    }
} else {
    echo "数値を入力してください。\n";
}
