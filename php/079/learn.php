<?php

// 検証対象
$userInput = "123-456-7890";

// 電話番号の形式を検証する正規表現
$pattern = "/^\d{3}-\d{3}-\d{4}$/";

// 正規表現を使用して電話番号の形式を検証
if (preg_match($pattern, $userInput)) {
  echo "電話番号は有効です。\n";
} else {
  echo "電話番号は無効な形式です。\n";
}
