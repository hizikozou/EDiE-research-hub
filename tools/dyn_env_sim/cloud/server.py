import http.server, socketserver, os, json, urllib.request

PORT = int(os.environ.get("PORT", 8080))
GEMINI_API_KEY = os.environ.get("GEMINI_API_KEY", "")

MODEL = os.environ.get("GEMINI_MODEL", "gemini-2.5-flash-preview-09-2025")

class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()

    def do_POST(self):
        # 1) APIルート
        if self.path == "/api/advice":
            if not GEMINI_API_KEY:
                self.send_response(500)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.end_headers()
                self.wfile.write(json.dumps({"error": {"message": "GEMINI_API_KEY is not set"}}).encode("utf-8"))
                return

            try:
                length = int(self.headers.get("Content-Length", "0"))
                raw = self.rfile.read(length).decode("utf-8") if length > 0 else "{}"
                body = json.loads(raw)
                prompt = body.get("prompt", "")

                url = f"https://generativelanguage.googleapis.com/v1beta/models/{MODEL}:generateContent?key={GEMINI_API_KEY}"
                payload = {
                    "contents": [{"parts": [{"text": prompt}]}]
                }

                req = urllib.request.Request(
                    url,
                    data=json.dumps(payload).encode("utf-8"),
                    headers={"Content-Type": "application/json"},
                    method="POST",
                )

                with urllib.request.urlopen(req, timeout=20) as resp:
                    data = resp.read().decode("utf-8")

                self.send_response(200)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.end_headers()
                self.wfile.write(data.encode("utf-8"))
                return

            except Exception as e:
                self.send_response(500)
                self.send_header("Content-Type", "application/json; charset=utf-8")
                self.end_headers()
                self.wfile.write(json.dumps({"error": {"message": str(e)}}).encode("utf-8"))
                return

        # 2) それ以外は 404
        self.send_response(404)
        self.end_headers()

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.serve_forever()
