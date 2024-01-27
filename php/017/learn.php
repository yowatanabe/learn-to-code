<?php
function getInput($message)
{
    echo $message;
    return trim(fgets(STDIN));
}

function isPalindrome($str)
{
    return $str === strrev($str);
}

$inputString = getInput("文字列を入力してください: ");

if (isPalindrome($inputString)) {
    echo "Yes\n";
} else {
    echo "No\n";
}
