# No.057

問題: マークダウン形式のテキストをHTMLに変換するシンプルなパーサーをPHPで実装してください。

1. `#` で始まる行は `<h1>` タグに変換します。例えば、`# タイトル` は `<h1>タイトル</h1>` に変換します。
2. `*` で囲まれたテキストは `<em>` タグに変換します。例えば、`これは *強調* されます` は `これは <em>強調</em> されます` に変換します。
