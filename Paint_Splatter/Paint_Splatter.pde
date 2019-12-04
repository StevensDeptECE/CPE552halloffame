/*

Author: Ziang,Ye;

Left click to draw paints;

*/


void setup() {
  size(600, 600);
  background(0);
  frameRate(30); 
  colorMode(HSB, 360, 100, 100);  
}
void draw() {
}
void mousePressed() { 
pushMatrix(); 
  translate(mouseX, mouseY); 
  float hu = random(360); 
  fill(hu, 100, 100); 
  noStroke(); 
  int dropNum = int(map(random(1), 0, 1, 800, 1000));
  for (int i = 0; i < dropNum; i++) { 
  float diameter = pow(random(1), 20); 
float distance = sq((1.0 - pow(diameter, 2)) * random(1)); 
float scaledDiameter = map(diameter, 0, 1, 1, 30);
float scaledDistance = map(distance, 0, 1, 1, 300); 
float radian = random(TWO_PI); 
ellipse(scaledDistance * cos(radian), scaledDistance * sin(radian), scaledDiameter, scaledDiameter);
ellipse(scaledDistance * sin(radian), scaledDistance * tan(radian), scaledDiameter, scaledDiameter);
} 
popMatrix(); 
}
