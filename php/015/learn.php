<?php
echo "文字列を入力してください: ";
$inputString = trim(fgets(STDIN));

$words = explode(' ', $inputString);
$reversedWords = array_map('strrev', $words);
$reversedString = implode(' ', $reversedWords);

echo "変換後の文字列: $reversedString\n";
