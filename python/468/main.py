from collections import OrderedDict


class LRUCache:
    def __init__(self, capacity):
        self.capacity = capacity
        self.cache = OrderedDict()

    def get(self, key):
        if key not in self.cache:
            return -1

        # 最近使ったものとして末尾へ移動
        self.cache.move_to_end(key)
        return self.cache[key]

    def put(self, key, value):
        if key in self.cache:
            self.cache.move_to_end(key)

        self.cache[key] = value

        # 容量を超えたら、最も古い要素を削除
        if len(self.cache) > self.capacity:
            self.cache.popitem(last=False)


# 実行例
cache = LRUCache(2)

print(cache.get("db"))  # -1
cache.put("db", "mysql")
cache.put("api", "v1")
print(cache.get("db"))  # mysql

cache.put("cache", "redis")

print(cache.get("api"))  # -1
print(cache.get("cache"))  # redis
print(cache.get("db"))  # mysql
