<?php

// テスト用データ
$_SERVER['REQUEST_METHOD'] = 'GET';
// $_SERVER['REQUEST_METHOD'] = 'POST';


header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    // タイムゾーンを設定
    date_default_timezone_set('Asia/Tokyo');

    // 現在の日時を取得
    $currentDateTime = date('Y-m-d H:i:s');

    // JSON形式で現在の日時を返す
    echo json_encode(['current_datetime' => $currentDateTime]);
} else {
    // GETリクエスト以外の場合は405 Method Not Allowedを返す
    http_response_code(405);
    echo json_encode(['error' => 'Method Not Allowed']);
}
