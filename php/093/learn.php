<?php
session_start(); // セッションを開始

// カートIDがセッションに存在しない場合、新しいカートIDを生成してセッションに保存
if (!isset($_SESSION['cart_id'])) {
    $_SESSION['cart_id'] = uniqid('cart_', true); // uniqidでユニークなIDを生成
}

echo "あなたのショッピングカートIDは: " . $_SESSION['cart_id'];
