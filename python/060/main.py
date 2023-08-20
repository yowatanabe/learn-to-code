import time

import pyautogui

# マウスを移動させる間隔（秒）を指定
interval = 180


def main():
    try:
        while True:
            # マウスを少し動かす
            pyautogui.moveRel(1, 0, duration=0.1)
            pyautogui.moveRel(-1, 0, duration=0.1)

            # intervalで指定した間隔（秒）を待機
            time.sleep(interval)

    except KeyboardInterrupt:
        # プログラムがCtrl+Cで停止された場合に終了
        print("プログラム実行終了")


if __name__ == "__main__":
    print("プログラム実行開始")
    print("プログラムを停止する場合はCtrl+Cを入力")
    main()
