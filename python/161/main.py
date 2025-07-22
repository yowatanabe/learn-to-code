class Solution:
    def removeDuplicates(self, s: str) -> str:
        stack = []
        for char in s:
            if stack and stack[-1] == char:
                stack.pop()
            else:
                stack.append(char)
        return "".join(stack)


# テスト
sol = Solution()
print(sol.removeDuplicates("abbaca"))  # 出力: "ca"
print(sol.removeDuplicates("azxxzy"))  # 出力: "ay"
