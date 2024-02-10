<?php

$csvFilePath = 'data.csv';

$csvData = array_map('str_getcsv', file($csvFilePath));

$headers = array_shift($csvData);

$result = array_filter($csvData, function ($row) {
    return isset($row[1]) && intval($row[1]) < 30;
});

echo "Name\tAge\tOccupation\n";
foreach ($result as $row) {
    echo implode("\t", $row) . "\n";
}
