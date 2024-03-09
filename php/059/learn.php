<?php

// ファイルから投票データを読み込む
$votes = file('votes.txt', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

// 各選択肢の投票数を集計する配列
$voteCounts = [
    'PHP' => 0,
    'JavaScript' => 0,
    'Python' => 0,
    'その他' => 0,
];

// 投票データを集計
foreach ($votes as $vote) {
    if (array_key_exists($vote, $voteCounts)) {
        $voteCounts[$vote]++;
    } else {
        $voteCounts['その他']++;
    }
}

// 結果を表示
foreach ($voteCounts as $language => $count) {
    echo $language . " - " . $count . "票\n";
}
