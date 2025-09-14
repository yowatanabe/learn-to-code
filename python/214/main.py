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


def lowest_common_ancestor_value(root: Optional[TreeNode], p: int, q: int) -> int:
    """
    二分木の LCA を再帰 DFS で求め、ノードの「値」を返す。
    - ベース: ノードが None、またはノード値が p/q のどちらかならそのノードを返す
    - 左右を探索して両方が非 None なら現在ノードが LCA
    - 片方だけ非 None ならその側を伝播
    """

    def dfs(node: Optional[TreeNode]) -> Optional[TreeNode]:
        if not node:
            return None
        if node.val == p or node.val == q:
            return node

        left = dfs(node.left)
        right = dfs(node.right)

        if left and right:
            return node
        return left if left else right

    lca = dfs(root)
    return lca.val if lca else None  # 問題設定上 None にはならない


# --- 動作確認用：レベル順配列から木を構築（None は子なし） ---
def build_tree(vals: List[Optional[int]]) -> Optional[TreeNode]:
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
root = build_tree([3, 5, 1, 6, 2, 0, 8, None, None, 7, 4])
print(lowest_common_ancestor_value(root, 5, 1))  # 3
print(lowest_common_ancestor_value(root, 5, 4))  # 5
print(lowest_common_ancestor_value(root, 6, 7))  # 5
