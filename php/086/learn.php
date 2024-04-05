<?php

// デフォルトのタイムゾーンを日本時間に設定
date_default_timezone_set('Asia/Tokyo');

// 仮のユーザー入力をシミュレート（実際にはフォームからのデータを使用）
$userFeedback = "これはテストフィードバックです。";

// 日本時間のタイムスタンプを使用してファイル名を生成
$timestamp = time();
$dateTime = date("Y_m_d_His", $timestamp); // 日時を「年_月_日_時分秒」の形式でフォーマット
$fileName = "feedback_" . $dateTime . ".txt";

// ファイルにフィードバックを書き込む
if (file_put_contents($fileName, $userFeedback)) {
    echo "フィードバックが正しく保存されました。ファイル名: " . $fileName . "\n";
} else {
    echo "フィードバックの保存に失敗しました。\n";
}
