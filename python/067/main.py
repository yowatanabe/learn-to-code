import http.server
import random


class RandomStatusCodeHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        # ランダムなステータスコードのリスト
        status_codes = [200, 200, 200, 200, 500, 503]
        random_status_code = random.choice(status_codes)
        self.send_response(random_status_code)
        self.end_headers()


if __name__ == "__main__":
    port = 8080
    server_address = ("", port)
    httpd = http.server.HTTPServer(server_address, RandomStatusCodeHandler)
    print(f"サーバーをポート{port}で起動中...")
    httpd.serve_forever()
