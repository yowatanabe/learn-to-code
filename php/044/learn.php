<?php

function searchValueInArray($assocArray, $searchValue)
{
    foreach ($assocArray as $key => $value) {
        if ($value === $searchValue) {
            return $key;
        }
    }
    return false;
}

$data = array(
    "key1" => "value1",
    "key2" => "value2",
    "key3" => "value3"
);

$searchValue = "value1";

$result = searchValueInArray($data, $searchValue);

if ($result !== false) {
    echo "値 '$searchValue' はキー '$result' に対応しています。\n";
} else {
    echo "値 '$searchValue' は配列内で見つかりませんでした。\n";
}
