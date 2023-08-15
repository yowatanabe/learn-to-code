from datetime import datetime, timedelta


def create_sql_insert(MAX, PER_DAY):
    file_path = "output.txt"
    YYYY_MM_DD = datetime(2023, 1, 1).strftime("%Y-%m-%d")
    COUNT = 0
    DAY = 1

    with open(file_path, "w") as f:
        for i in range(1, MAX + 1):
            if COUNT == PER_DAY:
                YYYY_MM_DD = (datetime(2023, 1, 1) + timedelta(DAY)).strftime(
                    "%Y-%m-%d"
                )
                COUNT = 0
                DAY += 1

            if i == MAX:
                f.write(f"  ({i}, {i:04}, '{YYYY_MM_DD}');")
            else:
                f.write(f"  ({i}, {i:04}, '{YYYY_MM_DD}'),\n")
                COUNT += 1


if __name__ == "__main__":
    MAX = int(input("登録する最大レコード数: "))
    PER_DAY = int(input("1日に登録されるレコード数: "))

    create_sql_insert(MAX, PER_DAY)
