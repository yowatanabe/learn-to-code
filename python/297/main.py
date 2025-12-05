from typing import List


def can_finish(numCourses: int, prerequisites: List[List[int]]) -> bool:
    """
    numCourses 個のコースと前提条件リスト prerequisites が与えられたとき、
    すべてのコースを履修可能か（= グラフにサイクルがないか）を True/False で返す。
    """

    # 隣接リストでグラフを表現する
    # edges[b] に「b を取ったあとに取れるコース」のリストを格納する
    edges = [[] for _ in range(numCourses)]
    for course, pre in prerequisites:
        edges[pre].append(course)

    # 0: 未訪問, 1: 訪問中（スタック上）, 2: 訪問済み
    state = [0] * numCourses

    def dfs(node: int) -> bool:
        """
        node から DFS して、サイクルがなければ True、
        サイクルを見つけたら False を返す。
        """
        if state[node] == 1:
            # 訪問中のノードに再び来た → サイクル検出
            return False
        if state[node] == 2:
            # すでにサイクルがないと確定しているノード
            return True

        # 現在探索中
        state[node] = 1

        # このノードから行けるすべての隣接ノードを DFS
        for nxt in edges[node]:
            if not dfs(nxt):
                return False  # 下流でサイクルを見つけた

        # 探索完了
        state[node] = 2
        return True

    # すべてのコースについて DFS を試す（グラフが非連結な場合もあるため）
    for course in range(numCourses):
        if state[course] == 0:
            if not dfs(course):
                return False  # どこかでサイクルを検出

    return True


if __name__ == "__main__":
    # 実行例1
    numCourses1 = 2
    prerequisites1 = [[1, 0]]
    print("例1の入力:", numCourses1, prerequisites1)
    print("例1の結果:", can_finish(numCourses1, prerequisites1))  # True

    # 実行例2
    numCourses2 = 2
    prerequisites2 = [[1, 0], [0, 1]]
    print("例2の入力:", numCourses2, prerequisites2)
    print("例2の結果:", can_finish(numCourses2, prerequisites2))  # False

    # 実行例3
    numCourses3 = 4
    prerequisites3 = [[1, 0], [2, 1], [3, 2]]
    print("例3の入力:", numCourses3, prerequisites3)
    print("例3の結果:", can_finish(numCourses3, prerequisites3))  # True

    # 実行例4
    numCourses4 = 3
    prerequisites4 = []
    print("例4の入力:", numCourses4, prerequisites4)
    print("例4の結果:", can_finish(numCourses4, prerequisites4))  # True
