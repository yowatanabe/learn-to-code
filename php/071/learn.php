<?php

$filename = 'test.log';


// ファイルが存在するかチェック
if (!file_exists($filename)) {
    die("ログファイルが見つかりません。\n");
}

// ファイルを開く
$file = fopen($filename, "r");

// ファイルの終わりに達するまで行を読み込む
while (!feof($file)) {
    $line = fgets($file);
    if (strpos($line, "Error") !== false) {
        echo $line;
    }
}

fclose($file);
