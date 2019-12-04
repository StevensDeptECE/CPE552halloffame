/*
function : Test player's APM in the game.
author : Zheng Liu
*/

void setup() {
  size(300, 400);
}

int gameState = 0;
int score = 0;
float counter;
float cps;

void draw() {
  background(240);
  noStroke();
  int c = 50+(score*2);
  fill(0, 100, 255, c);
  ellipse(150, 200, 275, 275);
  if (gameState == 0) {
    textAlign(CENTER, CENTER);
    fill(240);
    textSize(20);
    text("Click to Test", 150, 150);
    text("your APM(Action Per Minute)", 150, 200);
    text("in the game", 150, 250);
    if (mousePressed) {
      gameState = 1;
      counter = 0;
      score = 0;
    }
  }
  if (gameState == 1) {
    counter=counter+0.0183;
    textAlign(CENTER, CENTER);
    fill(240);
    textSize(200);
    text(score, 150, 200);
    textSize(50);
    fill(200);
    text(counter, 150, 375);
    textSize(25);
    if (counter > 60) {
      gameState = 2;
    }
  }
  if (gameState == 2) {
    textAlign(CENTER, CENTER);
    fill(240);
    textSize(200);
    text(score, 150, 200);
    textSize(25);
    fill(200);
    text("Clicks Per Second (APM):", 150, 355);
    textSize(25);
    cps = score/10;
    text(cps, 150, 385);
  }
}

void mousePressed() {
  if (gameState == 1) {
    score++;
  }
}
void keyPressed(){
  if(gameState == 1){
    score++;
  }
}
