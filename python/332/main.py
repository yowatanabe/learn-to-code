from typing import Optional, List, Tuple


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


def reverse_k_group(head: Optional[ListNode], k: int) -> Optional[ListNode]:
    if k <= 1 or not head:
        return head

    dummy = ListNode(0, head)
    group_prev = dummy

    while True:
        # k 個先のノードが存在するか確認（group_end を探す）
        kth = group_prev
        for _ in range(k):
            kth = kth.next
            if not kth:
                return dummy.next  # 残りが k 未満

        group_end = kth
        group_next = group_end.next

        # group_prev.next から group_end までを反転
        prev = group_next
        cur = group_prev.next
        while cur != group_next:
            nxt = cur.next
            cur.next = prev
            prev = cur
            cur = nxt

        # つなぎ替え
        new_group_head = group_end
        new_group_tail = group_prev.next
        group_prev.next = new_group_head
        group_prev = new_group_tail


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 3, 4, 5], 2),
        ([1, 2, 3, 4, 5], 3),
        ([], 3),
    ]

    for i, (vals, k) in enumerate(cases, start=1):
        head = build_linked_list(vals)
        out = reverse_k_group(head, k)
        print(f"例{i} 入力: vals={vals}, k={k}")
        print(f"例{i} 出力: {linked_list_to_list(out)}")
        print("-" * 50)
