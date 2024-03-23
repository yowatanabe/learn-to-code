<?php

// 単語リスト
$wordList = ["apple", "banana", "orange", "grape", "lemon"];

// 検索したい単語
$userInput = "banana";

// 単語リスト内で一致する単語を検索
if (in_array($userInput, $wordList)) {
    echo "見つかりました！\n";
} else {
    echo "見つかりませんでした。\n";
}
