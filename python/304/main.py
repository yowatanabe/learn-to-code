from typing import Optional, List


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
    """
    連結リストを k 個ずつ反転して返す。
    末尾が k 個未満の場合はその部分は反転しない。
    """
    if k <= 1 or not head:
        return head

    dummy = ListNode(0, head)
    group_prev = dummy  # 反転するグループの「直前」のノード

    while True:
        # 1) k 個先のノード（グループ末尾）を探す
        kth = group_prev
        for _ in range(k):
            kth = kth.next
            if not kth:
                return dummy.next  # k 個揃わないので終了

        group_next = kth.next  # グループの次（反転後に繋ぐ先）

        # 2) グループ内を反転する
        # 反転の典型: prev を group_next にしておくと最後に繋がる
        prev = group_next
        cur = group_prev.next  # グループ先頭
        while cur != group_next:
            nxt = cur.next
            cur.next = prev
            prev = cur
            cur = nxt

        # 3) 反転後のグループを前後に接続する
        # group_prev.next は反転後の先頭（= kth）
        old_group_start = group_prev.next
        group_prev.next = kth
        group_prev = old_group_start  # 次のグループの直前は「反転前の先頭」になる


def print_linked_list(head: Optional[ListNode]) -> None:
    vals = linked_list_to_list(head)
    print(" -> ".join(map(str, vals)) if vals else "(empty)")


if __name__ == "__main__":
    # 実行例1
    head1 = build_linked_list([1, 2, 3, 4, 5])
    k1 = 2
    print("例1 入力:", linked_list_to_list(head1), "k =", k1)
    out1 = reverse_k_group(head1, k1)
    print("例1 出力:", linked_list_to_list(out1))  # [2,1,4,3,5]

    # 実行例2
    head2 = build_linked_list([1, 2, 3, 4, 5])
    k2 = 3
    print("例2 入力:", linked_list_to_list(head2), "k =", k2)
    out2 = reverse_k_group(head2, k2)
    print("例2 出力:", linked_list_to_list(out2))  # [3,2,1,4,5]
