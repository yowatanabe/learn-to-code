<?php
function removeDuplicates($array)
{
    return array_values(array_unique($array));
}

$numbers = [1, 2, 3, 4, 2, 5, 6, 3, 7, 8];

$uniqueNumbers = removeDuplicates($numbers);

echo "元の配列: " . implode(", ", $numbers) . "\n";
echo "重複を削除した配列: " . implode(", ", $uniqueNumbers) . "\n";
