// --- グローバル変数 ---
Ball[] balls = new Ball[100];
PrintWriter output; 
int generation = 1;
int maxGenerations = 10;
int frameCountPerGen = 480;  // 通常時は8秒間隔
int framesUntilNextGen = 480; // 次の世代交代までのカウントダウン

float[] historyLR = new float[maxGenerations];
float[] historyFriction = new float[maxGenerations];

int mode = 0; // 0:設定, 1:シミュレーション, 2:結果
float mutationRateLR = 0.0001; 
float mutationRateFriction = 0.01;
float terrainPhase = 0; // 地形スライド用の変数 🧗

// --- setup ---
void setup() {
  size(600, 400);
  output = createWriter("experiment_log.txt"); 
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(20);

  if (mode == 0) {
    drawSettingScreen();
  } 
  else if (mode == 1) {
    runSimulation();
  } 
  else if (mode == 2) {
    drawGraph();
  }
}

// --- モード0: 設定画面 ---
void drawSettingScreen() {
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("=== EDiE SETTING ===", width/2, 100);
  
  // マウスのX座標で変異率をリアルタイム調整
  mutationRateLR = map(mouseX, 0, width, 0.00001, 0.002);
  
  textSize(16);
  text("Mutation Rate (LR): " + nf(mutationRateLR, 0, 5), width/2, 200);
  text("Current Strategy: Environment Resilience", width/2, 230);
  
  textSize(14);
  fill(200);
  text("Adjust with Mouse, then Click to Start", width/2, 320);
  
  if (mousePressed) {
    mode = 1;
  }
}

// --- モード1: シミュレーション本体 ---
void runSimulation() {
  drawTerrain();

  Ball bestBall = balls[0];
  float minLoss = 1000000;

  for (Ball b : balls) {
    b.update();
    b.display();
    
    float currentLoss = lossFunction(b.weight);
    if (currentLoss < minLoss) {
      minLoss = currentLoss;
      bestBall = b;
    }
  }

  // エリート（赤点）
  fill(255, 0, 0);
  float bx = map(bestBall.weight, -2, 2, 0, width);
  float by = lossFunction(bestBall.weight);
  ellipse(bx, by, 15, 15);

  // ステータス表示
  fill(255);
  textAlign(LEFT);
  text("Gen: " + generation, 20, 30);
  text("Next Eval in: " + nf(framesUntilNextGen/60.0, 0, 1) + "s", 20, 50);
  text("Press 'C' to trigger ENVIRONMENT CHANGE", 20, height - 20);

  // カウントダウン更新 ⏳
  framesUntilNextGen--;

  if (framesUntilNextGen <= 0) {
    handleGeneration(bestBall);
    framesUntilNextGen = frameCountPerGen; // 8秒に戻す
  }
}

// --- モード2: 結果表示 ---
void drawGraph() {
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("=== EVOLUTION GRAPH ===", width/2, 50);
  
  // 学習率（LR）の遷移を描画
  stroke(0, 255, 0);
  noFill();
  beginShape();
  for (int i = 0; i < historyLR.length; i++) {
    float x = map(i, 0, maxGenerations - 1, 80, width - 80);
    float y = map(historyLR[i], 0, 0.01, height - 80, 100);
    vertex(x, y);
    ellipse(x, y, 6, 6);
    fill(255);
    textSize(10);
    text(nf(historyLR[i], 0, 4), x, y - 10);
    noFill();
  }
  endShape();
  
  fill(200);
  textSize(14);
  text("X: Generation | Y: Learning Rate (Adaptability)", width/2, height - 30);
}

// --- 環境激変のトリガー ---
void keyPressed() {
  if (key == 'c' || key == 'C') {
    terrainPhase = random(100); // 地形をランダムにスライド 🧗
    framesUntilNextGen = 240;   // 強制的に4秒間の「観察猶予」を設定 ⚖️
    println("ENVIRONMENT CHANGE! Survival test started.");
  }
}

// --- 世代交代 ---
void handleGeneration(Ball elite) {
  if (generation <= maxGenerations) {
    output.println(generation + ", " + elite.myLR + ", " + elite.myFriction);
    historyLR[generation-1] = elite.myLR;
    historyFriction[generation-1] = elite.myFriction;
  }

  for (int i = 0; i < balls.length; i++) {
    // 突然変異
    balls[i].myLR = elite.myLR + random(-mutationRateLR, mutationRateLR);
    balls[i].myFriction = elite.myFriction + random(-mutationRateFriction, mutationRateFriction);
    balls[i].weight = random(-2, 2); // 位置リセット
    balls[i].velocity = 0;
  }
  
  generation++;
  if (generation > maxGenerations) {
    output.flush();
    output.close();
    mode = 2;
  }
}

// --- 地形関数 ---
float lossFunction(float w) {
  // terrainPhaseを足すことで地形がスライドする
  float baseHeight = height/2 + sin(w * 5 + terrainPhase) * 100 + cos(w * 2) * 50;
  
  float mouseW = map(mouseX, 0, width, -2, 2);
  float dist = abs(w - mouseW);
  float mouseEffect = (mousePressed && dist < 0.2) ? -150 * (0.2 - dist) : 0;
  
  return baseHeight + mouseEffect;
}

void drawTerrain() {
  stroke(255, 100);
  noFill();
  beginShape();
  for (float x = 0; x <= width; x += 5) {
    float w_val = map(x, 0, width, -2, 2);
    vertex(x, lossFunction(w_val));
  }
  endShape();
}

// --- ボールクラス ---
class Ball {
  float weight, velocity = 0;
  float myLR, myFriction;
  color myColor;

  Ball() {
    weight = random(-2, 2);
    myLR = random(0.0001, 0.01);
    myFriction = random(0.8, 0.99);
    myColor = color(random(100, 255), random(100, 255), 255, 150);
  }

  void update() {
    float currentLoss = lossFunction(weight);
    float nextLoss = lossFunction(weight + 0.01);
    float gradient = (nextLoss - currentLoss) / 0.01;
    velocity = (velocity * myFriction) + (gradient * myLR);
    weight += velocity;
  }

  void display() {
    float x = map(weight, -2, 2, 0, width);
    float y = lossFunction(weight);
    fill(myColor);
    noStroke();
    ellipse(x, y, 10, 10);
  }
}
