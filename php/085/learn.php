<?php

$grades = [
    ["name" => "User1", "scores" => ["数学" => 75, "英語" => 85, "科学" => 90]],
    ["name" => "User2", "scores" => ["数学" => 60, "英語" => 65, "科学" => 70]],
    ["name" => "User3", "scores" => ["数学" => 90, "英語" => 95, "科学" => 85]],
];

foreach ($grades as $student) {
    $average = array_sum($student["scores"]) / count($student["scores"]);
    if ($average >= 80) {
        echo $student["name"] . "の平均得点は" . $average . "点です。\n";
    }
}
