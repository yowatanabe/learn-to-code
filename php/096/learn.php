<?php

// データ抽出元のCSVファイルを開く
$handle = fopen("data.csv", "r");

// 新しいCSVファイルを書き込みモードで開く
$outputHandle = fopen("filtered_data.csv", "w");

// 最初の行（ヘッダー）を読み込み、そのまま新しいファイルに書き込む
$headers = fgetcsv($handle);
fputcsv($outputHandle, $headers);

// CSVファイルを一行ずつ読み込む
while (($data = fgetcsv($handle)) !== FALSE) {
    $productName = $data[0];
    $quantity = $data[1];
    $price = $data[2];

    // 販売数量が10以上のデータのみを新しいCSVに書き込む
    if ($quantity >= 10) {
        fputcsv($outputHandle, $data);
    }
}

// ファイルを閉じる
fclose($handle);
fclose($outputHandle);

echo "データの抽出が完了しました。\n";
