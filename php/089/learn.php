<?php

function checkAge($age)
{
    if ($age < 18) {
        throw new Exception("このサービスは18歳以上のユーザーを対象としています。");
    }
    return true;
}

try {
    // テスト用の年齢データ
    $userAge = 17;
    checkAge($userAge);
    echo "サービスへようこそ！";
} catch (Exception $e) {
    echo $e->getMessage();
}
