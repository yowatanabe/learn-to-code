<?php

// ユーザーからの入力をシミュレート（実際にはフォームからのPOSTデータを使用）
$userInput = "<script>alert('XSS');</script>";

// ユーザー入力のサニタイズ
$sanitizedInput = htmlspecialchars($userInput, ENT_QUOTES, 'UTF-8');

// サニタイズされた入力を表示
echo "こんにちは、" . $sanitizedInput . "さん！";
