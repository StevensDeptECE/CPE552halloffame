/*

  Author: Joey Rupert

*/

void setup() {
  
  size(1000, 1000, P3D);
  
  frameRate = 60;
   
}

float n = 0;

float p = 1;

float q = 1;

float r = 1;

void draw() {
  
  background(0);
  
  translate(500, 500, 50);
  
  rotateY((PI / 3) + n);
  
  rotateX((PI / 3) + n);
  
  rotateZ((PI / 3) + n);
  
  scale(120);
  
  stroke(255, 255, 255);
  
  strokeWeight(.01);
     
  for (float i = 0; i <= (2 * PI); i+= .0001) {
    
    point(cos(q * i), cos(r * i), cos(p * i));
    
    p = random(-50, 50) * cos(i);
    
    q = random(-50, 50) * sin(i);
    
    r = random(-50, 50) * tan(i);
    
  }
  
  n += .01;
    
}
