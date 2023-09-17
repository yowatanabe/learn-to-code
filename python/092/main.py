import os
import shutil


def copy_files_with_extension(source_dir, dest_dir, file_extension):
    try:
        # コピー元ディレクトリの確認
        if not os.path.exists(source_dir):
            raise Exception("コピー元ディレクトリが存在しません。")

        # コピー元ディレクトリ内のファイルを再帰的に検索
        for root, _, files in os.walk(source_dir):
            for file in files:
                if file.endswith(file_extension):
                    # ファイルのパスを作成
                    source_file_path = os.path.join(root, file)

                    # コピー先ディレクトリが存在しない場合は作成
                    if not os.path.exists(dest_dir):
                        os.makedirs(dest_dir)

                    # ファイルをコピー
                    shutil.copy(source_file_path, dest_dir)
                    print(f"{file} を {dest_dir} にコピーしました。")

    except Exception as e:
        print(f"エラー: {e}")


source_directory = input("コピー元ディレクトリを入力: ")
destination_directory = input("コピー先ディレクトリを入力: ")
file_extension = input("検索したいファイルの拡張子を入力 (例: .txt): ")

copy_files_with_extension(source_directory, destination_directory, file_extension)
