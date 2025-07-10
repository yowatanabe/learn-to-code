def decrypt_caesar_cipher(s: str, k: int) -> str:
    result = []
    for char in s:
        # 'a' = 97, 'z' = 122
        shifted = (ord(char) - ord("a") - k) % 26
        result.append(chr(ord("a") + shifted))
    return "".join(result)


# テスト
print(decrypt_caesar_cipher("dwwdfn", 3))  # 出力: "attack"
print(decrypt_caesar_cipher("khoor", 3))  # 出力: "hello"
