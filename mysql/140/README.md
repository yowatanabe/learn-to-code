# No.140

注文情報を管理する `orders` テーブルと、商品の在庫を管理する `products` テーブルがあります。

**要件**

1. **注文が追加されたとき** (`orders` テーブルにデータが挿入されたとき)、該当する**商品の在庫を自動的に減少**させる必要があります。
2. これを効率化するために、**ストアドプロシージャ**を作成し、**トリガーからストアドプロシージャを呼び出す構成**にしてください。
3. 在庫が不足している場合は**エラーをスロー**し、注文をキャンセルする必要があります。
4. 大量の同時注文が発生しても、**デッドロックが発生しないように最小限のロックを行う**必要があります。
