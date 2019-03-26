/**
 * author: Shiyao Li
 **/
void setup(){
  size(800, 800);
  background(255);
  stroke(0);
  translate(width/2, height/2);  
  float oldX = 0, oldY = 0.5;
  float a = 2, b = -2.5, c = 1.6, d = -0.3, mag = 180;
  for (int i = 0; i < 200000; i++){
  float newX= sin(a * oldY) - cos(b * oldX);
  float newY= sin(c * oldX) - cos(d * oldY);
  point(newX * mag, newY * mag);
  oldX=newX;
  oldY=newY;
  }
}
