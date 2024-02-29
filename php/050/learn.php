<?php
echo "あなたの名前は？ ";

$name = trim(fgets(STDIN));

if (!empty($name)) {
    echo "こんにちは、{$name}さん！\n";
} else {
    echo "こんにちは、ゲストさん！\n";
}
