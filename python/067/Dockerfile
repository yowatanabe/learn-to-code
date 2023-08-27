# ベースイメージを指定
FROM python:slim

# タイムゾーンを日本時間に設定
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# ランダムなステータスコードを返すPythonスクリプトをコピー
COPY main.py /app/main.py

# 必要なポートを公開
EXPOSE 8080

# コンテナ内で実行するコマンドを指定
# printの内容をコンソールに表示させるため"-u"オプションを付与
CMD ["python", "-u", "/app/main.py"]
