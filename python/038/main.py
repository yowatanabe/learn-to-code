def log_file_with_particular_keyword_that_search(
    log_file_path, keyword, output_file_path
):
    found_lines = []

    try:
        # ログファイルを開き、キーワードを検索
        with open(log_file_path, "r") as log_file:
            for line in log_file:
                if keyword in line:
                    found_lines.append(line)

        # マッチした行があれば、結果を新しいファイルに書き出す
        if found_lines:
            with open(output_file_path, "w") as output_file:
                output_file.writelines(found_lines)
            print(f"キーワード '{keyword}' を含む行が見つかりました。結果は '{output_file_path}' に保存されました。")
        else:
            print("キーワードが見つかりませんでした。")

    except FileNotFoundError:
        print("指定されたログファイルが見つかりません。")


if __name__ == "__main__":
    log_file_path = input("ログファイルのパスを入力してください: ")
    keyword = input("検索するキーワードを入力してください: ")
    output_file_path = input("結果を保存するファイルのパスを入力してください: ")

    log_file_with_particular_keyword_that_search(
        log_file_path, keyword, output_file_path
    )
