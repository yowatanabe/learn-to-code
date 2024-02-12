<?php
$csvFile = 'data.csv';

$conditionColumnIndex = 2;

$conditionValue = 'USA';

if (($handle = fopen($csvFile, 'r')) !== false) {
    while (($data = fgetcsv($handle, 1000, ',')) !== false) {
        if (isset($data[$conditionColumnIndex]) && $data[$conditionColumnIndex] === $conditionValue) {
            echo implode(',', $data) . "\n";
        }
    }
    fclose($handle);
}
