<?php
try {
    $result = 10 / 0;

    echo "エラーは発生しません。\n";
} catch (DivisionByZeroError $e) {
    echo "エラーが発生しました：" . $e->getMessage() . "\n";
} catch (Exception $e) {
    echo "予期せぬエラーが発生しました：" . $e->getMessage() . "\n";
} finally {
    echo "処理が完了しました。\n";
}
