import os
import shutil


def backup_files(source_dir, destination_dir):
    """
    すべてのファイルを source_dir から destination_dir にコピーする
    """

    # バックアップ元のディレクトリの存在確認
    try:
        files = os.listdir(source_dir)
    except FileNotFoundError:
        print(f"{source_dir}が見つかりませんでした。")
        return

    # バックアップ先のディレクトリが存在しなければ作成する
    if not os.path.exists(destination_dir):
        os.makedirs(destination_dir)

    # バックアップ処理
    for file in files:
        source_file_path = os.path.join(source_dir, file)
        destination_file_path = os.path.join(destination_dir, file)

        # バックアップ元のディレクトリに新しく追加されたファイルや変更されたファイルのみをコピー
        # 既にバックアップ先に存在するファイルは上書きしない
        if not os.path.exists(destination_file_path) or os.path.getmtime(
            source_file_path
        ) > os.path.getmtime(destination_file_path):
            shutil.copy2(source_file_path, destination_file_path)

    print("バックアップ完了")


if __name__ == "__main__":
    source_dir = input("バックアップ元のディレクトリを指定: ")
    destination_dir = input("バックアップ先のディレクトリを指定: ")
    backup_files(source_dir, destination_dir)
