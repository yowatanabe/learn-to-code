<?php
// 社員データの配列
$employees = [
    ['name' => '社員A', 'department' => '営業部', 'age' => 25],
    ['name' => '社員B', 'department' => '経理部', 'age' => 28],
    ['name' => '社員C', 'department' => '人事部', 'age' => 32],
    ['name' => '社員D', 'department' => '営業部', 'age' => 24],
    ['name' => '社員E', 'department' => '経理部', 'age' => 30],
];

// 全社員の名前を表示
echo "全社員の社員:\n";
foreach ($employees as $employee) {
    echo $employee['name'] . "\n";
}

// 営業部の社員の名前を表示
echo "営業部の社員:\n";
foreach ($employees as $employee) {
    if ($employee['department'] === '営業部') {
        echo $employee['name'] . "\n";
    }
}

// 全社員の平均年齢を計算
$totalAge = 0;
foreach ($employees as $employee) {
    $totalAge += $employee['age'];
}
$averageAge = $totalAge / count($employees);

echo "全社員の平均年齢: " . $averageAge . "\n";
