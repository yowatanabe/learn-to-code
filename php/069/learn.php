<?php

// ダミーデータ
$_GET['username'] = "testuser";


// クエリパラメータからユーザー名を取得
$username = isset($_GET['username']) ? $_GET['username'] : '';

// ユーザー名が指定されているか確認
if (!empty($username)) {
    // 指定されたユーザー名を使用してメッセージを生成
    $response = [
        'success' => true,
        'message' => "Hello, {$username}!"
    ];
} else {
    // エラーメッセージを設定
    $response = [
        'success' => false,
        'message' => 'Username is required.'
    ];
}

// JSON形式でレスポンスを返す
echo json_encode($response);
