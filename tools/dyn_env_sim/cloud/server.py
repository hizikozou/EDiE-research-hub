import http.server, socketserver, os
PORT = int(os.environ.get("PORT", 8080))
class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.serve_forever()
