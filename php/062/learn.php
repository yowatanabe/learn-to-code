<?php

// 住所録ファイル
$filename = 'address_book.txt';

// 新しいエントリを追加する関数
function addEntry($name, $email)
{
    global $filename;
    $entry = $name . "," . $email . "\n";
    file_put_contents($filename, $entry, FILE_APPEND);
}

// 住所録を検索する関数
function searchEntry($name)
{
    global $filename;
    $entries = file($filename, FILE_IGNORE_NEW_LINES);
    foreach ($entries as $entry) {
        list($entryName, $entryEmail) = explode(",", $entry);
        if ($entryName == $name) {
            return $entryEmail;
        }
    }
    return null;
}

// 住所録を表示する関数
function displayAddressBook()
{
    global $filename;
    $entries = file($filename, FILE_IGNORE_NEW_LINES);
    foreach ($entries as $entry) {
        list($name, $email) = explode(",", $entry);
        echo "名前: $name, メール: $email\n";
    }
}

// 新しい名前とメールアドレスを追加
addEntry("user1", "user1@example.com");

// 全エントリを表示
displayAddressBook();

// 特定の名前に対応するメールアドレスを検索
$email = searchEntry("user1");
echo "user1のメールアドレス: $email\n";
