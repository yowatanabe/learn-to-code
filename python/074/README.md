# No.074

問題: ファイル名に基づいてファイルを分類するスクリプトを作成してください。

特定のディレクトリにあるファイルを、ファイル名に含まれる特定のキーワードに基づいて分類するプログラムを開発する必要があります。プログラムは、ディレクトリ内のファイルをループし、ファイル名に指定のキーワードが含まれる場合、それを別のディレクトリに移動します。

以下の条件に従ってプログラムを作成してください：

1. ファイルが保存されているディレクトリはユーザーに対話的に入力させます。
1. ファイルを分類するためのキーワードはユーザーに対話的に入力させます。
1. ファイルが移動されるディレクトリの名前はキーワードと同じにします。例えば、キーワードが "image" ならば、ファイルは `./image` ディレクトリに移動されます。
1. プログラムは、ファイルが正常に移動された場合に移動先のパスを表示します。

以下はプログラムのサンプル実行例です：

```plaintext
$ python main.py
分類を行うディレクトリを指定: files
ファイル分類のキーワードを入力: app2
2 files matching the keyword "app2" were moved to the ./app2 directory.
```