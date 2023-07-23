def main():
    try:
        num = int(input("整数を入力してください："))
        if num % 2 == 0:
            print("偶数です")
        else:
            print("奇数です")
    except ValueError:
        print("エラー：整数以外が入力されました。")


if __name__ == "__main__":
    main()
