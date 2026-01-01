from typing import List


def merge_three_sorted_arrays(
    nums1: List[int], nums2: List[int], nums3: List[int]
) -> List[int]:
    i, j, k = 0, 0, 0
    result = []

    while i < len(nums1) or j < len(nums2) or k < len(nums3):
        # 各配列の現在のポインタを比較して、最小の値を選ぶ
        candidates = []
        if i < len(nums1):
            candidates.append((nums1[i], 1))
        if j < len(nums2):
            candidates.append((nums2[j], 2))
        if k < len(nums3):
            candidates.append((nums3[k], 3))

        # その中で最小の要素を選ぶ
        min_val, source = min(candidates, key=lambda x: x[0])

        # 選ばれた配列から次の要素を進める
        if source == 1:
            i += 1
        elif source == 2:
            j += 1
        elif source == 3:
            k += 1

        result.append(min_val)

    return result


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, 3, 5], [2, 4, 6], [0, 7, 8]),
        ([1, 2], [3, 4], [5, 6]),
        ([1], [], [2]),
    ]

    for i, (nums1, nums2, nums3) in enumerate(cases, start=1):
        print(f"例{i} 入力: nums1={nums1}, nums2={nums2}, nums3={nums3}")
        print(f"例{i} 出力: {merge_three_sorted_arrays(nums1, nums2, nums3)}")
        print("-" * 40)
