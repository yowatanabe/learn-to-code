<?php

$products = [
    ["name" => "スマートフォン", "price" => 50000, "category" => "電子機器"],
    ["name" => "ノートブック", "price" => 80000, "category" => "電子機器"],
    ["name" => "コーヒーメーカー", "price" => 12000, "category" => "家電"],
    ["name" => "電子レンジ", "price" => 15000, "category" => "家電"],
    ["name" => "タブレット", "price" => 60000, "category" => "電子機器"]
];


// フィルタリング対象のカテゴリー
$targetCategory = "電子機器";

// 特定のカテゴリーに属する商品をフィルタリング
$filteredProducts = array_filter($products, function ($product) use ($targetCategory) {
    return $product["category"] === $targetCategory;
});

// 価格でソート
usort($filteredProducts, function ($a, $b) {
    return $a["price"] <=> $b["price"];
});

// 結果を出力
foreach ($filteredProducts as $product) {
    echo $product["name"] . " - " . $product["price"] . "円\n";
}
