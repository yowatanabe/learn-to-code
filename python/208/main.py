from collections import deque
from typing import List, Optional


class TreeNode:
    def __init__(
        self,
        val: int = 0,
        left: "Optional[TreeNode]" = None,
        right: "Optional[TreeNode]" = None,
    ):
        self.val = val
        self.left = left
        self.right = right


def zigzag_level_order(root: Optional[TreeNode]) -> List[List[int]]:
    if not root:
        return []

    res = []
    q = deque([root])
    left_to_right = True  # 奇数段: 左→右, 偶数段: 右→左

    while q:
        size = len(q)
        level = deque()
        for _ in range(size):
            node = q.popleft()
            # 向きに応じて両端に積む
            if left_to_right:
                level.append(node.val)
            else:
                level.appendleft(node.val)

            if node.left:
                q.append(node.left)
            if node.right:
                q.append(node.right)

        res.append(list(level))
        left_to_right = not left_to_right

    return res


# --- 動作確認用の簡易ビルダー ---
def build_tree(vals: List[Optional[int]]) -> Optional[TreeNode]:
    """
    レベル順配列（Noneは子なし）から木を構築。
    例: [3,9,20,None,None,15,7]
    """
    if not vals:
        return None
    it = iter(vals)
    root = TreeNode(next(it))
    q = deque([root])
    for v in it:
        node = q.popleft()
        if v is not None:
            node.left = TreeNode(v)
            q.append(node.left)
        try:
            v = next(it)
        except StopIteration:
            break
        if v is not None:
            node.right = TreeNode(v)
            q.append(node.right)
    return root


# テスト
root1 = build_tree([3, 9, 20, None, None, 15, 7])
print(zigzag_level_order(root1))  # [[3], [20, 9], [15, 7]]

root2 = build_tree([1, 2, 3, 4, None, None, 5])
print(zigzag_level_order(root2))  # [[1], [3, 2], [4, 5]]

root3 = build_tree([])
print(zigzag_level_order(root3))  # []
