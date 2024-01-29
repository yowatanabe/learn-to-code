<?php
function getInput($message)
{
    echo $message;
    return trim(fgets(STDIN));
}

function hasAnagramPair($str1, $str2)
{
    $sortedStr1 = str_split($str1);
    $sortedStr2 = str_split($str2);
    sort($sortedStr1);
    sort($sortedStr2);
    return implode($sortedStr1) === implode($sortedStr2);
}

$inputString1 = getInput("文字列1を入力してください: ");
$inputString2 = getInput("文字列2を入力してください: ");

echo "$inputString1 と $inputString2 は" . (hasAnagramPair($inputString1, $inputString2) ? "アナグラムのペアです" : "アナグラムのペアではありません") . "\n";
