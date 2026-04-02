from typing import List

def partition_labels(s: str) -> List[int]:
    """
    各文字の「最後に出現する位置」を先に求めておく。

    左から走査しながら、
    現在見ている区間で登場した文字たちの「最後の出現位置」の最大値を
    end として管理する。

    走査位置 i が end に到達したら、
    そこまでで1つの区間を確定できる。

    計算量: O(n)
    """
    last_index = {ch: i for i, ch in enumerate(s)}

    result = []
    start = 0
    end = 0

    for i, ch in enumerate(s):
        end = max(end, last_index[ch])

        if i == end:
            result.append(end - start + 1)
            start = i + 1

    return result


if __name__ == "__main__":
    print(partition_labels("ababcbacadefegdehijhklij"))  # [9, 7, 8]
    print(partition_labels("eccbbbbdec"))                # [10]
    print(partition_labels("caedbdedda"))                # [1, 9]
