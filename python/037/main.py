import os


def filename_specified_string_includes_search(search_directory, search_string):
    found_files = []

    for root, _, files in os.walk(search_directory):
        for file in files:
            if search_string in file:
                found_files.append(os.path.abspath(os.path.join(root, file)))

    if found_files:
        print("**********")
        for file_path in found_files:
            print(file_path)
        print(f"合計{len(found_files)}個のファイルが見つかりました。")
    else:
        print("指定された文字列が含まれるファイルは見つかりませんでした。")


search_directory = input("検索するディレクトリのパスを入力してください: ")
search_string = input("検索する文字列を入力してください: ")

filename_specified_string_includes_search(search_directory, search_string)
