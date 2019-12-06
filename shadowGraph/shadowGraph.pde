// author: Hanfan Wang

float r = 0;
float backR;
float backG;
float backB;

void setup() {
  size(400, 400);
  backR = random(0, 100);
  backG = random(0, 100);
  backB = random(0, 100); 
  background(backR, backG, backB);
  rectMode(CENTER);
  
  noStroke();
  smooth();
}
 
void draw() { 
  fill(2, 50);
  // show shadow
  rect(width/2, height/2, width, height);
  fill(255);
  // move with mouse
  translate(mouseX, mouseY);
  rotate(r);
  // rect initial x, y must be (0, 0)
  rect(0, 0, 100, 100);
  r = r + 0.05;
}
