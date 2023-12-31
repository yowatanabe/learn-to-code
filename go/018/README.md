# No.018

問題: アイテムの在庫を管理するプログラムを書くことになりました。各アイテムには名前、在庫数、および価格情報が含まれています。以下のタスクを達成するためのGoプログラムを書いてください。

1. アイテム情報を格納するための構造体 `Item` を作成してください。この構造体は名前（string型）、在庫数（int型）、価格（float64型）のフィールドを持ちます。
1. アイテム情報を管理するためのマップを作成してください。このマップのキーはアイテムの名前であり、値は対応する `Item` 構造体です。
1. 新しいアイテムを追加する関数 `AddItem` を実装してください。この関数は名前、在庫数、および価格を受け取り、それを新しい `Item` インスタンスとしてマップに追加します。
1. 特定のアイテムの在庫数を更新する関数 `UpdateStock` を実装してください。この関数はアイテムの名前と新しい在庫数を受け取り、マップ内の該当するアイテムの在庫数を更新します。
1. 特定のアイテムの価格を更新する関数 `UpdatePrice` を実装してください。この関数はアイテムの名前と新しい価格を受け取り、マップ内の該当するアイテムの価格を更新します。
1. 特定のアイテムを削除する関数 `DeleteItem` を実装してください。この関数はアイテムの名前を受け取り、マップから該当するアイテムデータを削除します。
1. 特定のアイテムの詳細情報を取得する関数 `GetItemInfo` を実装してください。この関数はアイテムの名前を受け取り、対応する `Item` インスタンスを返します。
1. すべてのアイテムのリストを取得する関数 `GetAllItems` を実装してください。この関数はすべてのアイテムデータを含むスライスを返します。
