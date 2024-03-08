<?php

// カウンターのファイルパス
$counterFile = 'counter.txt';


// ファイルが存在しない場合は、カウンターを0に設定しファイルを作成
if (!file_exists($counterFile)) {
    file_put_contents($counterFile, 0);
}

// 現在のカウンター値を読み込み
$visits = (int)file_get_contents($counterFile);

// カウンターを増加
$visits++;

// 新しいカウンター値をファイルに保存
file_put_contents($counterFile, $visits);


echo "訪問者数: " . $visits . "\n";
