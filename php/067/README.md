# No.067

問題: PHPの学習でオブジェクト指向プログラミング（OOP）の概念を深めるために、単純な銀行口座クラス（BankAccount）を作成します。このクラスは、口座の現在の残高を追跡し、預金と引き出しの操作を行うことができる必要があります。

## `BankAccount`クラスの要件

1. **プロパティ**:
    - `private $balance`：口座の現在の残高（初期値は0）。

2. **メソッド**:
    - `public function deposit($amount)`：指定された金額を口座に預ける。
    - `public function withdraw($amount)`：指定された金額を口座から引き出す。口座の残高が引き出し額より少ない場合は、引き出しを行わずにエラーメッセージを表示する。
    - `public function getBalance()`：現在の口座残高を返す。
