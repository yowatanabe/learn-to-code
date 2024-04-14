<?php

// ユーザー入力（ここでは例として固定値を使用）
$inputDate = '2024-04-15';

// DateTimeオブジェクトの作成
$date = new DateTime($inputDate);

// 1ヶ月を加算
$date->modify('+1 month');

// 次の月の同日が存在しない場合、月の最後の日を取得するための調整
// 元の日付から1日引く
$dayBefore = (clone $date)->modify('-1 day');
if ($date->format('m') !== $dayBefore->format('m')) {
    // 月が変わっていたら、月の最終日を設定
    $date = $dayBefore;
}

// 結果の表示
echo $date->format('Y-m-d');
