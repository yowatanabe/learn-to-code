from typing import Optional, List
import heapq


class ListNode:
    def __init__(self, val: int = 0, next: Optional["ListNode"] = None):
        self.val = val
        self.next = next


def build_linked_list(values: List[int]) -> Optional[ListNode]:
    dummy = ListNode(0)
    cur = dummy
    for v in values:
        cur.next = ListNode(v)
        cur = cur.next
    return dummy.next


def linked_list_to_list(head: Optional[ListNode]) -> List[int]:
    res = []
    cur = head
    while cur:
        res.append(cur.val)
        cur = cur.next
    return res


def merge_k_lists(lists: List[Optional[ListNode]]) -> Optional[ListNode]:
    """
    k 個のソート済み連結リストを 1 本にマージして返す。
    時間: O(N log k)
    """
    heap = []
    counter = 0  # 同じ val のときに ListNode 同士の比較が起きないようにするため

    # 各リストの先頭をヒープへ
    for node in lists:
        if node:
            heapq.heappush(heap, (node.val, counter, node))
            counter += 1

    dummy = ListNode(0)
    tail = dummy

    while heap:
        _, _, node = heapq.heappop(heap)
        # 結果へ接続
        tail.next = node
        tail = tail.next

        # 次のノードがあればヒープへ
        if node.next:
            heapq.heappush(heap, (node.next.val, counter, node.next))
            counter += 1

    # 念のため末尾の next を切る（入力によっては安全）
    tail.next = None
    return dummy.next


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    # 例1
    lists1 = [
        build_linked_list([1, 4, 5]),
        build_linked_list([1, 3, 4]),
        build_linked_list([2, 6]),
    ]
    merged1 = merge_k_lists(lists1)
    print("例1 出力:", linked_list_to_list(merged1))  # [1,1,2,3,4,4,5,6]

    # 例2
    lists2 = []
    merged2 = merge_k_lists(lists2)
    print("例2 出力:", linked_list_to_list(merged2))  # []

    # 例3
    lists3 = [None]
    merged3 = merge_k_lists(lists3)
    print("例3 出力:", linked_list_to_list(merged3))  # []
