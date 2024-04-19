<?php

// 商品の在庫データ
$inventory = [
    ['name' => 'ペン', 'stock' => 5],
    ['name' => 'ノート', 'stock' => 20],
    ['name' => '消しゴム', 'stock' => 2]
];

$lowStockItems = [];

// 在庫をチェックし、閾値以下のものをリストアップ
foreach ($inventory as $item) {
    if ($item['stock'] <= 10) {
        $lowStockItems[] = $item['name'] . " (残り: " . $item['stock'] . "個)";
    }
}

// 在庫不足の商品がある場合、メールを送信
if (count($lowStockItems) > 0) {
    echo "以下の商品の在庫が不足しています\n";
    echo implode("\n", $lowStockItems) . "\n";
} else {
    echo "在庫不足の商品はありません。\n";
}
