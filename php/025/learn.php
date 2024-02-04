<?php
function isFutureDate($date)
{
    $currentDate = new DateTime();

    $inputDate = DateTime::createFromFormat('Y-m-d', $date);

    if ($inputDate && $currentDate < $inputDate) {
        return true;
    } else {
        return false;
    }
}

$testDate = '2024-02-05';

if (isFutureDate($testDate)) {
    echo "{$testDate} は未来の日付です。\n";
} else {
    echo "{$testDate} は過去または現在の日付です。\n";
}
