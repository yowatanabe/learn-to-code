# No.056

問題: ワーカープールを使用して非同期でタスクを実行するプログラムを作成してください。プログラムは以下の要件を満たす必要があります。

1. `Task`という構造体があり、その中に実行すべき関数と関連するデータが含まれています。
1. ワーカープールは指定された数のgoroutineで構成され、それぞれがタスクを処理します。
1. メインのgoroutineはタスクをワーカープールに送信し、各タスクの完了を待ちます。
1. プログラムは各タスクの実行時間を記録し、最終的にそれらの結果を表示します。