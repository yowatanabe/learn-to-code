# No.025

問題: タスクトラッキングプログラムを作成する仕事を持っています。各タスクには、タイトル、優先度（1から3の整数）、完了フラグ（真または偽）が含まれています。以下は、関連する情報を示すためのGoの構造体です。

```go
type Task struct {
    Title     string
    Priority  int
    Completed bool
}
```

以下のタスクを達成するためのGoプログラムを作成してください：

1. プログラムには、タスクを格納するためのスライスを作成してください。
1. プログラムには、優先度を示す定数（1から3の整数）を作成してください。
1. タスクの新規追加、表示、完了フラグの切り替え、タスクの削除の操作を行う関数を作成してください。
1. プログラムはユーザーからの入力を受け入れ、ユーザーが操作を選択できる簡単なコマンドラインインタフェースを提供する必要があります。
1. ユーザーが終了を選択するまでプログラムは続行される必要があります。
