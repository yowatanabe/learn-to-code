from typing import List


def can_jump(nums: List[int]) -> bool:
    """
    ジャンプゲーム: インデックス0からスタートして、
    最後のインデックスに到達できるかどうかを True/False で返す。
    貪欲法で O(n)。
    """
    max_reach = 0  # 現時点で到達可能な「最右インデックス」

    for i, jump in enumerate(nums):
        # もし i が max_reach より右にあるなら、そもそもここには来れない
        if i > max_reach:
            return False

        # ここに来れるなら、ここからさらにどこまで伸ばせるかを更新
        max_reach = max(max_reach, i + jump)

        # すでに最後のインデックス以降に届くなら True で終了してよい
        if max_reach >= len(nums) - 1:
            return True

    # ループを抜けた時点で max_reach が最後に届いているかどうか
    return max_reach >= len(nums) - 1


if __name__ == "__main__":
    # 実行例1
    nums1 = [2, 3, 1, 1, 4]
    print("例1の入力:", nums1)
    print("例1の結果:", can_jump(nums1))  # True

    # 実行例2
    nums2 = [3, 2, 1, 0, 4]
    print("例2の入力:", nums2)
    print("例2の結果:", can_jump(nums2))  # False

    # 実行例3
    nums3 = [0]
    print("例3の入力:", nums3)
    print("例3の結果:", can_jump(nums3))  # True

    # 実行例4
    nums4 = [2, 0, 0]
    print("例4の入力:", nums4)
    print("例4の結果:", can_jump(nums4))  # True
