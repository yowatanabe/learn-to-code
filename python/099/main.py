from collections import defaultdict


def parse_log_file(log_file_path):
    # ユニークなIPアドレスのセットを作成
    unique_ip_addresses = set()

    # HTTPメソッドとレスポンスステータスの分布を格納する辞書を作成
    http_methods = defaultdict(int)
    response_statuses = defaultdict(int)

    with open(log_file_path, "r") as file:
        for line in file:
            # スペースで分割してログエントリを要素に分解
            elements = line.split()
            if len(elements) >= 7:
                ip_address = elements[0]
                http_method = elements[5][1:]  # ダブルクォーテーションを除去
                response_status = elements[8]

                # ユニークなIPアドレスをセットに追加
                unique_ip_addresses.add(ip_address)

                # HTTPメソッドとレスポンスステータスのカウントを更新
                http_methods[http_method] += 1
                response_statuses[response_status] += 1

    # 結果を出力
    print(f"ユニークなIPアドレスの数: {len(unique_ip_addresses)}")
    print("HTTPメソッドの分布:")
    for method, count in http_methods.items():
        print(f"{method}: {count}")
    print("レスポンスステータスコードの分布:")
    for status, count in response_statuses.items():
        print(f"{status}: {count}")


log_file_path = input("ログファイルのパス: ")
parse_log_file(log_file_path)
