<?php
// セッションを開始
session_start();

// 訪問回数のカウンタがセットされていなければ初期化
if (!isset($_SESSION['visit_count'])) {
  $_SESSION['visit_count'] = 0;
}

// 訪問回数をインクリメント
$_SESSION['visit_count'] += 1;

// 訪問回数を表示
echo "あなたはこのセッションで" . $_SESSION['visit_count'] . "回このページを訪れました。\n";
