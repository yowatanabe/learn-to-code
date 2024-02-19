<?php

$data = [
    'name' => 'User1',
    'age' => 20,
    'city' => 'Tokyo'
];

$jsonString = json_encode($data);
$decodedData = json_decode($jsonString, true);

echo "元のデータ:\n";
print_r($data);

echo "\nJSON形式の文字列:\n";
echo $jsonString;

echo "\n復元されたデータ:\n";
print_r($decodedData);
