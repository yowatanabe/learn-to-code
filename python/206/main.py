class Node:
    __slots__ = ("key", "val", "prev", "next")

    def __init__(self, key=0, val=0):
        self.key = key
        self.val = val
        self.prev = None
        self.next = None


class LRUCache:
    def __init__(self, capacity: int):
        self.cap = capacity
        self.map = {}  # key -> Node
        # ダミーの両端番兵ノード（head:最も新しい側、tail:最も古い側）
        self.head = Node()
        self.tail = Node()
        self.head.next = self.tail
        self.tail.prev = self.head

    # 内部ユーティリティ: ノードを連結リストから外す
    def _remove(self, node: Node) -> None:
        p, n = node.prev, node.next
        p.next = n
        n.prev = p

    # 内部ユーティリティ: ノードをhead直後（=最も新しい位置）に差し込む
    def _push_front(self, node: Node) -> None:
        node.next = self.head.next
        node.prev = self.head
        self.head.next.prev = node
        self.head.next = node

    def get(self, key: int) -> int:
        if key not in self.map:
            return -1
        node = self.map[key]
        # 最近使われたので先頭へ移動
        self._remove(node)
        self._push_front(node)
        return node.val

    def put(self, key: int, value: int) -> None:
        if key in self.map:
            # 値更新 + 先頭へ
            node = self.map[key]
            node.val = value
            self._remove(node)
            self._push_front(node)
            return

        # 新規挿入
        node = Node(key, value)
        self.map[key] = node
        self._push_front(node)

        # 容量超過なら最も古い（tail.prev）を削除
        if len(self.map) > self.cap:
            lru = self.tail.prev
            self._remove(lru)
            del self.map[lru.key]


# 動作確認
ops = ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
args = [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]

out = []
cache = None
for op, ar in zip(ops, args):
    if op == "LRUCache":
        cache = LRUCache(ar[0])
        out.append(None)
    elif op == "put":
        cache.put(ar[0], ar[1])
        out.append(None)
    else:  # get
        out.append(cache.get(ar[0]))

print(out)
# 期待: [None, None, None, 1, None, -1, None, -1, 3, 4]
