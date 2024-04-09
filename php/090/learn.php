<?php

function fibonacci($n)
{
    if ($n <= 0) {
        return 0;
    } elseif ($n == 1) {
        return 1;
    } else {
        return fibonacci($n - 1) + fibonacci($n - 2);
    }
}

// テスト: 8番目のフィボナッチ数を計算(出力: 21)
echo fibonacci(8);
