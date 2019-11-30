/*
  Author: Zichao Xie
*/

void setup() {
  size(500, 400);
  background(100, 100, 255);
}

float x = 40;
float y = 40;
float d = 1;
float sx = 3;
float sy = 2;
float sd = 1;

void draw() {
  background(100, 100, 255);
  fill(255);
  circle(x, y, d);
  x += sx;
  y += sy;
  
  if (d < 1 || d > 80) {
    sd = -sd;
  }
  if (x+d/2 > width || x-d/2 <= 0) {
    sx = -sx;
  }
  if (y+d/2 > height || y-d/2 <= 0) {
    sy = -sy;
  }
  d += sd;
}
