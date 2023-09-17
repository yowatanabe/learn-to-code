import os


def get_size(path):
    total_size = 0
    for dirpath, _, filenames in os.walk(path):
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            total_size += os.path.getsize(filepath)
    return total_size


def convert_bytes(byte_size):
    for unit in ["B", "KB", "MB", "GB", "TB"]:
        if byte_size < 1024.0:
            break
        byte_size /= 1024.0
    return f"{byte_size:.2f} {unit}"


if __name__ == "__main__":
    directory = input("ディレクトリのパスを入力: ")

    if os.path.exists(directory):
        total_size = get_size(directory)
        print(f"ディレクトリ {directory} の合計サイズは {convert_bytes(total_size)} です。")
    else:
        print("指定されたディレクトリが存在しません。")
