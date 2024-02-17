<?php

for ($i = 1; $i <= 100; $i++) {
    $isFizz = ($i % 3 == 0);
    $isBuzz = ($i % 5 == 0);

    if ($isFizz && $isBuzz) {
        echo "FizzBuzz\n";
    } elseif ($isFizz) {
        echo "Fizz\n";
    } elseif ($isBuzz) {
        echo "Buzz\n";
    } else {
        echo "$i\n";
    }
}
