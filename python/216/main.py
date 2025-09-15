def simplify_path(path: str) -> str:
    parts = path.split("/")
    stack = []
    for p in parts:
        if p == "" or p == ".":
            # 空（連続スラッシュ）/ カレントは無視
            continue
        if p == "..":
            if stack:
                stack.pop()  # 1つ上へ
            # ルートなら何もしない
        else:
            stack.append(p)  # ディレクトリ名を積む
    return "/" + "/".join(stack) if stack else "/"


# テスト
print(simplify_path("/home/"))  # "/home"
print(simplify_path("/../"))  # "/"
print(simplify_path("/home//foo/"))  # "/home/foo"
print(simplify_path("/a/./b/../../c/"))  # "/c"
print(simplify_path("/a//b////c/d//././/.."))  # "/a/b/c"
