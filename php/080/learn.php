<?php

$filename = 'data.txt';
$count = 0;

if (($file = fopen($filename, "r")) !== FALSE) {
  while (($line = fgetcsv($file, 1000, ",")) !== FALSE) {
    if ((int)$line[1] >= 30) {
      $count++;
    }
  }
  fclose($file);
}

echo "30歳以上の人物は " . $count . " 人います。\n";
