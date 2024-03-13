<?php

// ダミーデータ
$_POST['username'] = 'User123';
$_POST['email'] = 'user@example.com';
$_POST['password'] = 'Password1';

$errors = [];

// ユーザー名のバリデーション
if (empty($_POST['username']) || strlen($_POST['username']) < 3 || strlen($_POST['username']) > 20) {
    $errors[] = 'ユーザー名は必須で、3文字以上20文字以下でなければなりません。';
}

// メールアドレスのバリデーション
if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
    $errors[] = '無効なメールアドレス形式です。';
}

// パスワードのバリデーション
if (!preg_match('/(?=.*\d)(?=.*[A-Z]).{8,}/', $_POST['password'])) {
    $errors[] = 'パスワードは8文字以上で、少なくとも1つの数字と1つの大文字を含む必要があります。';
}

// エラーメッセージの表示
if (!empty($errors)) {
    foreach ($errors as $error) {
        echo "<p>$error</p>";
    }
} else {
    echo "登録が完了しました。\n";
}
