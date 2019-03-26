import java.util.Random;

void setup(){
  size(800,800);
  background(0);
}

//int r = 21,

void draw(){
  boolean click = true;
  if (mousePressed == true) {
    click = false;
  }
  Random r1 = new Random();
  Random g1 = new Random();
  Random b1 = new Random();
  int rf = r1.nextInt(256);
  int gf = g1.nextInt(256);
  int bf = b1.nextInt(256);
  
  drawSpheres(mouseX, mouseY, pmouseX, pmouseY, rf, gf, bf, click);
}

void drawSpheres(int x, int y, int px, int py, int f1, int f2, int f3, boolean click) {
  float speed = abs(x-px) + abs(y-py);

  fill(f1, f2, f3);
  if(click) {
    ellipse(x, y, speed, speed);
  } else {
    rect(x, y, speed, speed);
  }
}
