<?php

function convertUrlsToLinks($text)
{
    $pattern = '/(https?:\/\/\S+)/';
    $replacement = '<a href="$1" target="_blank">$1</a>';
    $textWithLinks = preg_replace($pattern, $replacement, $text);

    return $textWithLinks;
}

$text = "Check out this website: https://www.example.com";
echo convertUrlsToLinks($text) . "\n";
