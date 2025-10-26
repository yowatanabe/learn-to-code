class LRUCache:
    """
    LRUキャッシュを実装するクラス。

    内部構造:
      - self.map: key -> Node で O(1) 参照
      - ダブルリンクリスト:
          head <-> ... <-> tail
        ・head直後が「最も最近使われた」ノード
        ・tail直前が「最も古い」ノード
      - ダミーのhead/tailを置いて実装を簡単にする
    """

    class Node:
        __slots__ = ("key", "val", "prev", "next")

        def __init__(self, key: int, val: int):
            self.key = key
            self.val = val
            self.prev = None
            self.next = None

    def __init__(self, capacity: int):
        self.cap = capacity
        self.map = {}  # key -> Node

        # ダミーノードを用意
        self.head = self.Node(0, 0)  # 最も新しい側（headの直後が最新）
        self.tail = self.Node(0, 0)  # 最も古い側（tailの直前が最古）
        self.head.next = self.tail
        self.tail.prev = self.head

    # 内部ユーティリティ: ノードをリストから外す
    def _remove(self, node: "LRUCache.Node") -> None:
        prev_n = node.prev
        next_n = node.next
        prev_n.next = next_n
        next_n.prev = prev_n
        node.prev = node.next = None  # 明示的に切る（なくても良いが安全）

    # 内部ユーティリティ: ノードをhead直後(=最も新しい位置)に挿入
    def _insert_to_head(self, node: "LRUCache.Node") -> None:
        node.next = self.head.next
        node.prev = self.head
        self.head.next.prev = node
        self.head.next = node

    # 内部ユーティリティ: LRUなノード（tail直前）を削除し、mapからも消す
    def _evict_from_tail(self) -> None:
        lru = self.tail.prev
        if lru is self.head:
            return  # 何もない場合(通常は起きない)
        self._remove(lru)
        del self.map[lru.key]

    def get(self, key: int) -> int:
        """
        key があれば値を返し、そのノードを「最近使われた」扱いで先頭に移動。
        なければ -1。
        O(1)
        """
        node = self.map.get(key)
        if node is None:
            return -1
        # 最近使われたので先頭へ
        self._remove(node)
        self._insert_to_head(node)
        return node.val

    def put(self, key: int, value: int) -> None:
        """
        key が既にあれば値を更新し、先頭へ移動。
        なければ新規ノードを作って先頭に置く。
        容量オーバーしたらLRU(末尾側)を1つ捨てる。
        O(1)
        """
        node = self.map.get(key)
        if node is not None:
            # 既存更新
            node.val = value
            self._remove(node)
            self._insert_to_head(node)
            return

        # 新規
        new_node = self.Node(key, value)
        self.map[key] = new_node
        self._insert_to_head(new_node)

        # オーバーしたら末尾を追い出す
        if len(self.map) > self.cap:
            self._evict_from_tail()


# 簡単なテスト (問題文の例と同じシナリオ)
if __name__ == "__main__":
    cache = LRUCache(2)
    cache.put(1, 10)  # {1=10}
    cache.put(2, 20)  # {1=10,2=20}
    print(cache.get(1))  # -> 10 (1が最新に)
    cache.put(3, 30)  # 2が追い出される
    print(cache.get(2))  # -> -1
    print(cache.get(3))  # -> 30
    cache.put(1, 15)  # 1を更新 (10->15)
    print(cache.get(1))  # -> 15
    print(cache.get(3))  # -> 30
