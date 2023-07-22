import re

text = """
来週に打ち合わせさせてください。
私の電話番号は000-1234-5678です。
折返しお待ちしています。
"""

pattern = r"\d{3}-\d{4}-\d{4}"
match = re.search(pattern, text)

if match:
    print(match.group())
