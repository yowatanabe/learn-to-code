<?php

function findLongestWord($str)
{
    $words = explode(" ", $str);
    $longestWord = "";

    foreach ($words as $word) {
        if (strlen($word) > strlen($longestWord)) {
            $longestWord = $word;
        }
    }
    return $longestWord;
}

$string = "PHP is a popular scripting language used for web development";

$longestWord = findLongestWord($string);
echo "最も長い単語: $longestWord" . "\n";
