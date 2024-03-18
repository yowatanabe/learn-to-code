<?php

$json = '[
    {
        "name": "スマートフォン",
        "price": 200000,
        "category": "電子機器"
    },
    {
        "name": "ノートブック",
        "price": 150000,
        "category": "電子機器"
    },
    {
        "name": "コーヒーメーカー",
        "price": 32000,
        "category": "家電"
    }
]';

// JSONデータをデコード
$products = json_decode($json, true);

// 特定のカテゴリーの商品を抽出
$targetCategory = "電子機器";

echo "{$targetCategory}の商品リスト:\n";

foreach ($products as $product) {
    if ($product['category'] === $targetCategory) {
        echo "* {$product['name']}: {$product['price']}円\n";
    }
}
