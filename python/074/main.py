import os
import shutil


def classification_of_files_by_filename(target_dir, keyword):
    # ディレクトリを作成（存在しない場合）
    output_dir = f"./{keyword}"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # ファイルを分類
    count = 0
    for filename in os.listdir(target_dir):
        if keyword in filename:
            source_path = os.path.join(target_dir, filename)
            dest_path = os.path.join(output_dir, filename)
            shutil.move(source_path, dest_path)
            count += 1

    # 移動したファイルの数と移動先のディレクトリを表示
    print(
        f'{count} files matching the keyword "{keyword}" were moved to the {output_dir} directory.'
    )


# ユーザーから分類キーワードを入力
target_dir = input("分類を行うディレクトリを指定: ")
keyword = input("ファイル分類のキーワードを入力: ")

classification_of_files_by_filename(target_dir, keyword)
