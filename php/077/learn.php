<?php

// テスト用ダミーデータ
$jsonResponse = '{
  "weather": [
    {
      "description": "晴れ"
    }
  ],
  "main": {
    "temp": 286.5
  },
  "name": "東京"
}';


// JSONをデコード
$response = json_decode($jsonResponse, true);

// 天気の状態と気温を抽出
$weatherDescription = $response['weather'][0]['description'];
$temperatureKelvin = $response['main']['temp'];
$cityName = $response['name'];

// 気温を摂氏に変換
$temperatureCelsius = $temperatureKelvin - 273.15;

// メッセージを表示
echo "{$cityName}の現在の天気: {$weatherDescription}、気温: " . round($temperatureCelsius, 2) . "度" . "\n";
