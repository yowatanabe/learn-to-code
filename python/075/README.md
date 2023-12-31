# No.075

問題: コンフィグファイルのバリデーションツール

アプリケーションのコンフィグファイルが正しく設定されているかどうかを自動的にチェックするツールを作成する必要があります。コンフィグファイルはYAML形式で書かれており、特定のキーとバリューの組み合わせが正しく設定されているかを確認するプログラムを作成します。

以下の条件に従ってプログラムを作成してください：

1. コンフィグファイルのパスはユーザーに対話的に入力させます。
1. プログラムはYAMLフォーマットのコンフィグファイルを読み込みます。
1. バリデーションルールは以下の通りです（キーとバリューの組み合わせ）：
   - `database_url`: 文字列
   - `api_key`: 文字列
   - `debug_mode`: 真偽値
1. コンフィグファイルがバリデーションに合格した場合は「コンフィグファイルは正常です」と表示します。
1. バリデーションに合格しない場合は、どのキーが問題を引き起こしているかとその内容を表示します。

以下はプログラムのサンプル実行例です：

```plaintext
$ python main.py
コンフィグファイルのパスを入力: config/test1.yaml
Config file is valid.

$ python main.py
コンフィグファイルのパスを入力: config/test2.yaml
Validation result:
- database_url: Key is missing
- api_key: Value must be a str
- debug_mode: Value must be a bool
```
