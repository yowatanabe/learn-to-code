<?php
function getInputArray($message)
{
    echo $message;
    $input = trim(fgets(STDIN));
    $array = explode(',', $input);
    $array = array_map('intval', $array);
    return $array;
}

$numbers = getInputArray("数字の配列を入力してください（カンマ区切り）: ");

sort($numbers);

echo "ソート後の配列: " . implode(', ', $numbers) . "\n";
