def can_rearrange_to_target(s, t):
    if len(s) != len(t):
        return False

    count = {}

    for ch in s:
        count[ch] = count.get(ch, 0) + 1

    for ch in t:
        if ch not in count or count[ch] == 0:
            return False
        count[ch] -= 1

    return True


# 実行例
s1 = "silent"
t1 = "listen"

s2 = "aabbcc"
t2 = "abccba"

s3 = "aabbc"
t3 = "aabbd"

print(can_rearrange_to_target(s1, t1))  # True
print(can_rearrange_to_target(s2, t2))  # True
print(can_rearrange_to_target(s3, t3))  # False
