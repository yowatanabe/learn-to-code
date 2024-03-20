<?php

$inventory = [
    "テレビ" => 30,
    "冷蔵庫" => 20,
    "洗濯機" => 50,
];

// 商品の追加
function addProduct(&$inventory, $product, $quantity)
{
    if (isset($inventory[$product])) {
        $inventory[$product] += $quantity;
    } else {
        $inventory[$product] = $quantity;
    }
}

// 在庫の確認
function checkInventory($inventory, $product)
{
    if (isset($inventory[$product])) {
        echo "{$product}の在庫は{$inventory[$product]}個です。\n";
    } else {
        echo "{$product}は在庫にありません。\n";
    }
}

// 商品の販売
function sellProduct(&$inventory, $product, $quantity)
{
    if (isset($inventory[$product]) && $inventory[$product] >= $quantity) {
        $inventory[$product] -= $quantity;
        echo "{$product}を{$quantity}個販売しました。\n";
    } else {
        echo "{$product}の在庫が不足しています。\n";
    }
}

// 商品の追加と在庫の確認
addProduct($inventory, "テレビ", 10);
checkInventory($inventory, "テレビ");

// 商品の販売
sellProduct($inventory, "テレビ", 5);
checkInventory($inventory, "テレビ");
