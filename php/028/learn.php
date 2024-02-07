<?php
function convertToUpper(array $arr)
{
    $upperArray = array_map('strtoupper', $arr);
    return $upperArray;
}

$testArray = ["apple", "banana", "orange"];

$convertedArray = convertToUpper($testArray);
print_r($convertedArray);
