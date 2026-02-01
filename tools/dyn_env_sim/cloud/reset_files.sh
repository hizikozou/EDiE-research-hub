# 1. 必要なファイルを現在の場所に作り直す
cat << 'INNER_EOF' > index.html
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>EDiE DYN Simulator</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.0/p5.js"></script>
    <style>body { margin: 0; background: #141414; display: flex; justify-content: center; align-items: center; height: 100vh; color: white; }</style>
</head>
<body>
    <script>
        let balls = []; let mode = 0; let terrainPhase = 0;
        function setup() { createCanvas(600, 400); for(let i=0; i<50; i++) balls.push(new Ball()); }
        function draw() {
            background(20);
            if (mode === 0) { fill(255); textAlign(CENTER); text("EDiE DYN: Click to Start", width/2, height/2); if(mouseIsPressed) mode=1; }
            else { drawTerrain(); for(let b of balls){ b.update(); b.display(); } }
        }
        function drawTerrain() {
            stroke(255, 50); noFill(); beginShape();
            for(let x=0; x<=width; x+=10) vertex(x, height/2 + sin(x*0.05 + terrainPhase)*50);
            endShape();
        }
        function keyPressed() { if(key === 'c') terrainPhase = random(100); }
        class Ball {
            constructor() { this.x = random(width); this.y = 0; this.v = 0; }
            update() { this.y = height/2 + sin(this.x*0.05 + terrainPhase)*50; this.x += random(-1, 1); if(this.x > width) this.x=0; if(this.x < 0) this.x=width; }
            display() { fill(0, 150, 255); noStroke(); ellipse(this.x, this.y, 8, 8); }
        }
    </script>
</body>
</html>
INNER_EOF

cat << 'INNER_EOF' > server.py
import http.server, socketserver, os
PORT = int(os.environ.get("PORT", 8080))
class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache')
        super().end_headers()
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    httpd.serve_forever()
INNER_EOF

cat << 'INNER_EOF' > Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
EXPOSE 8080
CMD ["python", "server.py"]
INNER_EOF

# 2. ビルドとデプロイを実行
IMAGE_NAME="asia-northeast1-docker.pkg.dev/$GOOGLE_CLOUD_PROJECT/cloud-run-source-deploy/edie-dyn-sim:latest"

echo "--------------------------------------------------"
echo "ビルドを開始します..."
gcloud builds submit --tag $IMAGE_NAME .

echo "デプロイを実行します..."
gcloud run deploy edie-dyn-sim \
  --image $IMAGE_NAME \
  --allow-unauthenticated \
  --region asia-northeast1 \
  --quiet
