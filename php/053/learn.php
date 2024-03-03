<?php

date_default_timezone_set('Asia/Tokyo');

function addDiaryEntry($entry)
{
    $filePath = 'diary.txt';
    $date = date('Y-m-d H:i:s');
    $formattedEntry = $date . " - " . $entry . "\n";

    file_put_contents($filePath, $formattedEntry, FILE_APPEND);
}

function readDiaryEntries()
{
    $filePath = 'diary.txt';
    if (file_exists($filePath)) {
        $contents = file_get_contents($filePath);
        echo "日記のエントリー:\n" . $contents;
    } else {
        echo "日記がまだ存在しません。\n";
    }
}

// 日記にエントリーを追加（ユーザー入力の模擬）
addDiaryEntry("今日はPHPの勉強をしました。");

readDiaryEntries();
