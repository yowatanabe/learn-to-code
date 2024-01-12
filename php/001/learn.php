<?php
echo "あなたの名前は？ ";

$name = trim(fgets(STDIN));

if (!empty($name)) {
    echo "Hello, $name!\n";
} else {
    echo "名前が入力されていません\n";
}
