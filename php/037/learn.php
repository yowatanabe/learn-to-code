<?php

function getDayOfWeek($year, $month, $day)
{
    $date = new DateTime("$year-$month-$day");

    return $date->format('l');
}

$year = 2024;
$month = 2;
$day = 17;

$result = getDayOfWeek($year, $month, $day);
echo "The day of the week for $year-$month-$day is: $result\n";
