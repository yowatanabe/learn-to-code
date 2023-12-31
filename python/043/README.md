# No.043

問題: 特定のフォルダ内にある複数のテキストファイルの内容を結合して、1つの統合されたテキストファイルを作成する自動化スクリプトを作成してください。

要件:

1. ユーザーに結合対象となるフォルダのパスを入力してもらいます。
1. 指定されたフォルダ内のすべてのテキストファイルの内容を1つの統合されたテキストファイルに結合します。
1. プログラム実行時に、結合が正常に行われたかどうかをログファイルに記録します。

注意:

- 結合されたテキストファイルは、ファイルの作成先のディレクトリに「merged.txt」という名前で作成されるものとします。
- ログファイルは、プログラム実行時のカレントディレクトリに「merge_log.txt」という名前で作成されるものとします。

この回答例では、指定したフォルダ内のすべてのテキストファイルの内容を1つの統合されたテキストファイルに結合するDevOps自動化タスクを作成しています。統合されたテキストファイルは、指定したファイル名でフォルダ内に作成され、結合されたファイル名のリストは「merge_log.txt」というログファイルに記録されます。
