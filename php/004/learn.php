<?php
function areAnagrams($str1, $str2)
{
    $normalizedStr1 = strtolower($str1);
    $normalizedStr2 = strtolower($str2);

    $sortedStr1 = str_split($normalizedStr1);
    $sortedStr2 = str_split($normalizedStr2);

    sort($sortedStr1);
    sort($sortedStr2);

    return $sortedStr1 === $sortedStr2;
}

echo "1つ目の文字列を入力してください: ";
$str1 = trim(fgets(STDIN));

echo "2つ目の文字列を入力してください: ";
$str2 = trim(fgets(STDIN));

if (areAnagrams($str1, $str2)) {
    echo "アナグラムです。\n";
} else {
    echo "アナグラムではありません。\n";
}
