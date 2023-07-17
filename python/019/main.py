import os

current_dir = os.getcwd()
files = os.listdir(current_dir)

print(f"現在のディレクトリ:\n{current_dir}")
print("ファイル一覧:")
for file in files:
    print(file)
