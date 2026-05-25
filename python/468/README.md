# No.468

## 問題文

### 直近アクセスされた設定を管理する LRU キャッシュ

あなたは設定値を高速に取得するため、容量制限付きキャッシュを実装します。

キャッシュの容量 `capacity` が与えられます。

以下の操作を処理してください。

* `get(key)`: キーが存在すれば値を返す。存在しなければ `-1` を返す
* `put(key, value)`: キーと値を保存する。容量を超えた場合、**最も長い間使われていないキー**を削除する

`get` または `put` でアクセスされたキーは、最新使用扱いになります。

## 実行例

```python
cache = LRUCache(2)

print(cache.get("db"))       # -1
cache.put("db", "mysql")
cache.put("api", "v1")
print(cache.get("db"))       # mysql

cache.put("cache", "redis")  # "api" が削除される

print(cache.get("api"))      # -1
print(cache.get("cache"))    # redis
print(cache.get("db"))       # mysql
```

## 実行結果

```
-1
mysql
-1
redis
mysql
```
