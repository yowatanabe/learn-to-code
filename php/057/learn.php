<?php

function markdownToHtml($markdown)
{
    // ヘッダー、強調テキストの変換
    $markdown = preg_replace('/^# (.*)$/m', '<h1>$1</h1>', $markdown);
    $markdown = preg_replace('/\*([^*]+)\*/', '<em>$1</em>', $markdown);

    return $markdown;
}

// テスト用のマークダウン文字列
$markdownText = "# タイトル\n\nこれは *強調* されます\n";

echo markdownToHtml($markdownText);
