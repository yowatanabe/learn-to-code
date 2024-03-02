<?php

// 初期商品リスト
$products = [
    ['name' => '商品A', 'price' => 1500],
    ['name' => '商品B', 'price' => 2500],
    ['name' => '商品C', 'price' => 500],
];

// 商品を追加
function addProduct(&$products, $name, $price)
{
    $products[] = ['name' => $name, 'price' => $price];
}

// 特定の価格範囲内の商品をリストアップ
function listProductsInPriceRange($products, $minPrice, $maxPrice)
{
    $filteredProducts = array_filter($products, function ($product) use ($minPrice, $maxPrice) {
        return $product['price'] >= $minPrice && $product['price'] <= $maxPrice;
    });
    return $filteredProducts;
}

// 商品を価格の昇順で表示
function displayProductsSortedByPrice($products)
{
    usort($products, function ($a, $b) {
        return $a['price'] <=> $b['price'];
    });
    foreach ($products as $product) {
        echo $product['name'] . ': ' . $product['price'] . "円\n";
    }
}

// 関数の使用例
addProduct($products, '商品D', 1200);
$filteredProducts = listProductsInPriceRange($products, 1000, 3000);
displayProductsSortedByPrice($filteredProducts);
