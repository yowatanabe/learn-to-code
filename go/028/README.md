# No.028

問題: 簡単なファイルシステムを作成することになりました。各ファイルとディレクトリには名前とタイプがあります。以下は、関連する情報を示すためのGoの構造体です。

```go
type File struct {
	Name string
	Type string // "file"または"directory"
}

type Directory struct {
	Name    string
	Files   []File
	SubDirs []Directory
}
```

以下のタスクを達成するためのGoプログラムを作成してください：

1. プログラムには、ルートディレクトリを作成してください。
1. プログラムには、新しいファイルまたはディレクトリを追加する関数を作成してください。
1. プログラムには、指定された名前のファイルまたはディレクトリを検索する関数を作成してください。
1. プログラムは、ディレクトリの階層構造を表示する関数を提供する必要があります。
1. ファイルまたはディレクトリが見つからない場合はエラーメッセージを表示する必要があります。
