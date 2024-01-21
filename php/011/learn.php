<?php
echo "身長（メートル単位）を入力してください: ";
$height = trim(fgets(STDIN));

echo "体重（キログラム単位）を入力してください: ";
$weight = trim(fgets(STDIN));

$bmi = $weight / ($height * $height);

echo "BMI: $bmi\n";
if ($bmi < 18.5) {
    echo "低体重\n";
} elseif ($bmi >= 18.5 && $bmi < 25) {
    echo "普通体重\n";
} else {
    echo "肥満\n";
}
