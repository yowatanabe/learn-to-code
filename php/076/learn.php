<?php

$orders = file('orders.txt', FILE_IGNORE_NEW_LINES);

$summary = [];
foreach ($orders as $order) {
    list($item, $quantity) = explode(',', $order);
    if (!isset($summary[$item])) {
        $summary[$item] = 0;
    }
    $summary[$item] += (int)$quantity;
}

$output = '';
foreach ($summary as $item => $quantity) {
    $output .= $item . ': ' . $quantity . "\n";
}
file_put_contents('summary.txt', $output);

echo "注文のサマリーが summary.txt に保存されました。\n";
