import filecmp
import os
import shutil


def backup_files(source_dir, backup_dir):
    # ソースディレクトリ内のファイルとバックアップディレクトリ内のファイルを比較
    dcmp = filecmp.dircmp(source_dir, backup_dir)

    # バックアップディレクトリにない新しいファイルをコピー
    for src_file in dcmp.left_only:
        src_path = os.path.join(source_dir, src_file)
        dest_path = os.path.join(backup_dir, src_file)
        shutil.copy2(src_path, dest_path)
        print(f"コピーされたファイル: {src_file}")

    # ソースディレクトリ内にあるがバックアップディレクトリ内にないファイルを削除
    for src_file in dcmp.right_only:
        src_path = os.path.join(backup_dir, src_file)
        os.remove(src_path)
        print(f"削除されたファイル: {src_file}")

    # サブディレクトリを再帰的に処理
    for sub_dir in dcmp.common_dirs:
        sub_source = os.path.join(source_dir, sub_dir)
        sub_backup = os.path.join(backup_dir, sub_dir)
        backup_files(sub_source, sub_backup)


source_directory = input("ソースディレクトリのパスを指定: ")
backup_directory = input("バックアップディレクトリのパスを指定: ")

backup_files(source_directory, backup_directory)
