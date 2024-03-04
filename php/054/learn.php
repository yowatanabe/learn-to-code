<?php

// APIエンドポイント
$url = 'https://jsonplaceholder.typicode.com/posts';

// cURLセッションを初期化
$curl = curl_init($url);

// cURLオプションを設定
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

// APIからのレスポンスを取得
$response = curl_exec($curl);

// cURLセッションを終了
curl_close($curl);

// JSONレスポンスをデコードしてPHPの配列に変換
$posts = json_decode($response, true);

// 投稿のタイトルをリスト形式で表示
echo "<ul>";
foreach ($posts as $post) {
    echo "<li>" . htmlspecialchars($post['title']) . "</li>";
}
echo "</ul>";
