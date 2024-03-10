<?php

// 暗号化するメッセージ
$message = "パスワード";

// 秘密鍵の生成
$secretKey = openssl_random_pseudo_bytes(32);

// 初期化ベクトルの生成
$iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));

// メッセージの暗号化
$encrypted = openssl_encrypt($message, 'aes-256-cbc', $secretKey, 0, $iv);
echo "暗号化されたメッセージ: " . $encrypted . "\n";

// 暗号化されたメッセージの復号化
$decrypted = openssl_decrypt($encrypted, 'aes-256-cbc', $secretKey, 0, $iv);
echo "復号化されたメッセージ: " . $decrypted . "\n";
