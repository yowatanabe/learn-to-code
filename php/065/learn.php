<?php

$Xday = "2025-12-31";
$xday = new DateTime($Xday);
$today = new DateTime();

if ($xday < $today) {
    $xday->modify('+1 year');
}

$interval = $today->diff($xday);

if ($interval->days == 0) {
    echo "今日がXデーです！\n";
} else {
    echo "Xデーまであと" . $interval->days . "日です。\n";
}
