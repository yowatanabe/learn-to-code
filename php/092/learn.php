<?php

$directory = './';
$files = scandir($directory);

foreach ($files as $file) {
    if (pathinfo($file, PATHINFO_EXTENSION) === 'txt') {
        echo $file . "\n";
    }
}
