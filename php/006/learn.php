<?php
function isPalindrome($str)
{
    $cleanedStr = preg_replace('/[^a-z]/i', '', strtolower($str));
    return $cleanedStr === strrev($cleanedStr);
}

echo "文字列を入力してください: ";
$userInput = trim(fgets(STDIN));

if (isPalindrome($userInput)) {
    echo "パリンドロームです。\n";
} else {
    echo "パリンドロームではありません。\n";
}
