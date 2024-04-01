<?php

$xml = simplexml_load_file("products.xml");

foreach ($xml->product as $product) {
    $name = $product->name;
    $price = $product->price;
    echo "商品名: $name, 価格: ¥$price\n";
}
