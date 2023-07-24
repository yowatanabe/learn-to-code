import os


def find_extension(extension):
    # 現在のディレクトリ情報を取得
    current_dir = os.getcwd()

    # ファイルの情報を取得
    file_list = os.listdir(current_dir)

    # 特定の拡張子を持つファイルを検索
    for file_name in file_list:
        if file_name.endswith(extension):
            print(file_name)


extension = ".csv"
find_extension(extension)
