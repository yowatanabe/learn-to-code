<?php

// 動作確認用にダミーデータを手動で設定
$_POST['eventName'] = 'テストイベント';
$_POST['eventDate'] = '2024-03-07 09:00';
$_POST['attendees'] = '10';

// フォームからの入力を取得
$eventName = $_POST['eventName'];
$eventDate = $_POST['eventDate'];
$attendees = $_POST['attendees'];

// エラーメッセージを格納する配列
$errors = [];

// イベント名の検証
if (empty($eventName)) {
    $errors[] = "イベント名は必須です。";
}

// 開催日時の検証
$dateTimePattern = '/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/';
if (!preg_match($dateTimePattern, $eventDate)) {
    $errors[] = "開催日時はYYYY-MM-DD HH:MMの形式である必要があります。";
}

// 参加人数の検証
if (!filter_var($attendees, FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]])) {
    $errors[] = "参加人数は正の整数である必要があります。";
}

// エラーメッセージの表示または登録完了のメッセージ
if (!empty($errors)) {
    foreach ($errors as $error) {
        echo "<p>$error</p>\n";
    }
} else {
    echo "イベント登録が完了しました。\n";
}
