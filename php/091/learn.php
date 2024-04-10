<?php

// テスト用データ
$_SERVER['REQUEST_METHOD'] = 'GET';
// $_SERVER['REQUEST_METHOD'] = 'POST';
// $_SERVER['REQUEST_METHOD'] = '';


header('Content-Type: application/json');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        // 仮の商品情報
        $products = [
            ['id' => 1, 'name' => '商品1', 'price' => 30000],
            ['id' => 2, 'name' => '商品2', 'price' => 50000],
        ];
        echo json_encode($products, JSON_UNESCAPED_UNICODE);
        break;
    case 'POST':
        // POSTリクエストから商品情報を取得（実際にはバリデーションなどが必要）
        $productInfo = json_decode(file_get_contents('php://input'), true);
        // 商品情報を登録する処理（この例では仮の動作）
        // 実際にはデータベースへの登録処理など
        echo json_encode(['message' => '商品を登録しました'], JSON_UNESCAPED_UNICODE);
        break;
    default:
        // 対応していないHTTPメソッドの場合
        http_response_code(405);
        echo json_encode(['message' => '許可されていないメソッドです'], JSON_UNESCAPED_UNICODE);
        break;
}
