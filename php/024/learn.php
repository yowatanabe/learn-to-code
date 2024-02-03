<?php
function removeDuplicates($array)
{
    $uniqueArray = [];
    foreach ($array as $element) {
        if (!in_array($element, $uniqueArray)) {
            $uniqueArray[] = $element;
        }
    }
    return $uniqueArray;
}

$array = [1, 2, 2, 3, 4, 4, 5];

$newArray = removeDuplicates($array);
echo "重複しない要素のみの配列: ";
print_r($newArray);
