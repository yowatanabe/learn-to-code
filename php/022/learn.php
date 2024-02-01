<?php
$userInput = readline("テキストを入力してください: ");

function countWords($text)
{
    $words = explode(" ", $text);
    return count($words);
}

$wordCount = countWords($userInput);
echo "入力されたテキストに含まれる単語の数は $wordCount 個です。\n";
