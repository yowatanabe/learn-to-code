<?php

// テストデータ
$_GET['city'] = 'Tokyo';


// リクエストから都市名を取得
$city = isset($_GET['city']) ? $_GET['city'] : '';

// 仮の天気予報データ
$forecasts = [
    "Tokyo" => ["forecast" => "Sunny", "temperature" => 25],
    "New York" => ["forecast" => "Cloudy", "temperature" => 18],
    "London" => ["forecast" => "Rainy", "temperature" => 15],
];

// 指定された都市の天気予報を応答
header('Content-Type: application/json');
if (array_key_exists($city, $forecasts)) {
    echo json_encode([
        "city" => $city,
        "forecast" => $forecasts[$city]['forecast'],
        "temperature" => $forecasts[$city]['temperature']
    ]);
} else {
    echo json_encode(["error" => "City not found"]);
}
