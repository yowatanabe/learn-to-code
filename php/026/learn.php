<?php
function countWordOccurrences($text, $word)
{
    $textLower = strtolower($text);
    $wordLower = strtolower($word);

    $count = substr_count($textLower, $wordLower);

    return $count;
}

$text = "PHP is a widely-used scripting language.";
$word = "PHP";

echo "単語 '{$word}' はテキスト内で " . countWordOccurrences($text, $word) . " 回出現します。\n";
