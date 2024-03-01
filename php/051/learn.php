<?php
// $_POST に動作確認用のダミーデータを設定
$_POST['name'] = 'test';
$_POST['email'] = 'test@example.com';
$_POST['comment'] = 'test';


// ユーザー入力
$name = $_POST['name'];
$email = $_POST['email'];
$comment = $_POST['comment'];

// エラーメッセージを格納する配列
$errors = [];

// 名前のバリデーション
if (empty($name)) {
    $errors[] = "名前を入力してください。";
} elseif (strlen($name) < 2) {
    $errors[] = "名前は2文字以上である必要があります。";
}

// メールアドレスのバリデーション
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = "無効なメールアドレスです。";
}

// コメントのバリデーション
if (empty($comment)) {
    $errors[] = "コメントを入力してください。";
} elseif (strlen($comment) > 140) {
    $errors[] = "コメントは140文字以内である必要があります。";
}

// エラーのチェックと出力
if (!empty($errors)) {
    foreach ($errors as $error) {
        echo "<p>$error</p>\n";
    }
} else {
    echo "すべての入力が正常に検証されました。\n";
}
