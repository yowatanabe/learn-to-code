<?php

// ダミーデータ
$_GET['id'] = 2;

$users = [
    1 => ['name' => 'user1', 'email' => 'user1@example.com'],
    2 => ['name' => 'user2', 'email' => 'user2@example.com'],
];

header('Content-Type: application/json');

// ユーザーIDの取得
$userId = isset($_GET['id']) ? (int)$_GET['id'] : 0;

// ユーザー情報の取得とレスポンスの返送
if (array_key_exists($userId, $users)) {
    echo json_encode([
        'success' => true,
        'data' => $users[$userId],
    ]);
} else {
    http_response_code(404);
    echo json_encode([
        'success' => false,
        'message' => 'User not found',
    ]);
}
