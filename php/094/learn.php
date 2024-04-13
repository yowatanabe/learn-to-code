<?php

// テスト用データ
$_SERVER["REQUEST_METHOD"] = "POST";
$_POST['email'] = "user@example.com";
$_POST['password'] = "Password123";


// フォームが送信された場合の処理
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $errors = [];

    // Eメールのバリデーション
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "無効なEメールアドレス形式です。";
    }

    // パスワードのバリデーション
    if (!preg_match("/^(?=.*[A-Z])(?=.*\d).{8,}$/", $password)) {
        $errors[] = "パスワードは8文字以上で、少なくとも1つの数字と1つの大文字を含む必要があります。";
    }

    // エラーメッセージの表示
    if (empty($errors)) {
        echo "登録が完了しました。";
    } else {
        foreach ($errors as $error) {
            echo "<p>" . htmlspecialchars($error) . "</p>";
        }
    }
}
