<?php

// テスト用データ
$userInputUsername = 'admin';
$userInputPassword = 'password123';


// ログイン検証
function validateLogin($username, $password)
{
    $correctUsername = 'admin';
    $correctPassword = 'password123';

    if ($username === $correctUsername && $password === $correctPassword) {
        return true;
    } else {
        return false;
    }
}

// ログイン結果のチェック
if (validateLogin($userInputUsername, $userInputPassword)) {
    echo "ログイン成功!\n";
} else {
    echo "ログイン失敗: ユーザー名またはパスワードが間違っています。\n";
}
