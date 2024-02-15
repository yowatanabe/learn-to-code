<?php

function doubleArray($arr)
{
    $doubledArray = array();

    foreach ($arr as $element) {
        $doubledArray[] = $element * 2;
    }

    return $doubledArray;
}

$arr = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

$result = doubleArray($arr);
print_r($result);
