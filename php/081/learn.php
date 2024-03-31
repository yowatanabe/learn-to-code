<?php

$message = "Hello, PHP encryption!";
$cipherMethod = "AES-256-CBC";
$secretKey = "mysecretkey";
$ivLength = openssl_cipher_iv_length($cipherMethod);
$iv = openssl_random_pseudo_bytes($ivLength);

// メッセージの暗号化
$encryptedMessage = openssl_encrypt($message, $cipherMethod, $secretKey, 0, $iv);
echo "暗号化されたメッセージ: " . $encryptedMessage . "\n";

// 暗号化されたメッセージの復号
$decryptedMessage = openssl_decrypt($encryptedMessage, $cipherMethod, $secretKey, 0, $iv);
echo "復号されたメッセージ: " . $decryptedMessage . "\n";
