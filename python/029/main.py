def division():
    print("これは任意の数値1と数値2を割り算するプログラムです")
    while True:
        try:
            n1 = float(input("任意の数値1を入力してください： "))
            n2 = float(input("任意の数値2を入力してください： "))
            print(f"計算結果：{n1 / n2}")
            break
        except ValueError:
            print("エラー：数値を入力してください")
            print("再度数値を入力してください\n")
        except ZeroDivisionError:
            print("エラー：0で割ることはできません")
            print("再度数値を入力してください\n")


division()
