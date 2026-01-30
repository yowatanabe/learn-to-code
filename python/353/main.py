from typing import Optional, List


class ListNode:
    def __init__(self, val: int = 0, next: Optional["ListNode"] = None):
        self.val = val
        self.next = next


def reverse_k_group(head: Optional[ListNode], k: int) -> Optional[ListNode]:
    if k <= 1 or not head:
        return head

    dummy = ListNode(0, head)
    group_prev = dummy

    while True:
        # k個あるかチェックして、グループ末尾を見つける
        kth = group_prev
        for _ in range(k):
            kth = kth.next
            if not kth:
                return dummy.next  # 残りがk未満

        group_next = kth.next

        # group_prev.next から kth までを反転
        prev = group_next
        cur = group_prev.next
        while cur != group_next:
            nxt = cur.next
            cur.next = prev
            prev = cur
            cur = nxt

        # 付け替え（group_prev の次が新しい先頭になる）
        new_group_head = kth
        old_group_head = group_prev.next
        group_prev.next = new_group_head
        group_prev = old_group_head  # 次のグループの前に進む


def build_list(values: List[int]) -> Optional[ListNode]:
    dummy = ListNode()
    cur = dummy
    for v in values:
        cur.next = ListNode(v)
        cur = cur.next
    return dummy.next


def to_list(head: Optional[ListNode]) -> List[int]:
    out = []
    cur = head
    while cur:
        out.append(cur.val)
        cur = cur.next
    return out


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 2, 3, 4, 5], 2, [2, 1, 4, 3, 5]),
        ([1, 2, 3, 4, 5], 3, [3, 2, 1, 4, 5]),
        ([1, 2], 3, [1, 2]),
    ]

    for i, (values, k, expected) in enumerate(cases, start=1):
        head = build_list(values)
        new_head = reverse_k_group(head, k)
        got = to_list(new_head)
        print(f"例{i} 入力: values={values}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
