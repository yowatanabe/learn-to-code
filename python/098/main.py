import random


# ランダムなIPアドレスを生成
def generate_ip():
    return ".".join(str(random.randint(0, 255)) for _ in range(4))


# ランダムな日付と時間を生成
def generate_timestamp():
    days = random.randint(1, 30)
    months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
    ]
    years = random.randint(2020, 2023)
    hours = random.randint(0, 23)
    minutes = random.randint(0, 59)
    seconds = random.randint(0, 59)
    return f"[{days:02d}/{random.choice(months)}/{years}:{hours:02d}:{minutes:02d}:{seconds:02d} +0000]"


# ランダムなHTTPリクエストを生成
def generate_request():
    methods = ["GET", "POST", "PUT", "DELETE"]
    pages = ["/page1", "/page2", "/page3", "/login", "/logout"]
    http_version = "HTTP/1.1"
    return f'"{random.choice(methods)} {random.choice(pages)} {http_version}"'


# ランダムなHTTPステータスコードを生成
def generate_status_code():
    return str(random.choice([200, 201, 204, 301, 404, 500]))


# ランダムなレスポンスサイズを生成
def generate_response_size():
    return str(random.randint(100, 5000))


# ログエントリを生成
def generate_log_entry():
    ip = generate_ip()
    timestamp = generate_timestamp()
    request = generate_request()
    status_code = generate_status_code()
    response_size = generate_response_size()
    return f"{ip} - - {timestamp} {request} {status_code} {response_size}\n"


# ログファイルを生成
log_file_path = input("生成するログファイル名: ")
log_file_size = int(input("生成するログファイルサイズ(例. 100KB -> 102400): "))

with open(log_file_path, "w") as log_file:
    while True:
        log_entry = generate_log_entry()
        log_file.write(log_entry)
        if log_file.tell() >= log_file_size:
            break

print(f"ログファイル {log_file_path} を生成しました。")
