<?php

$filePath = 'example.txt';

try {
    // ファイルの存在を確認
    if (!file_exists($filePath)) {
        throw new Exception("ファイルが見つかりません。\n");
    }

    // ファイルの内容を読み込む
    $content = file_get_contents($filePath);
    if ($content === false) {
        throw new Exception("ファイルの読み込みに失敗しました。\n");
    }

    echo nl2br($content);
} catch (Exception $e) {
    echo "エラーが発生しました: " . $e->getMessage();
}
