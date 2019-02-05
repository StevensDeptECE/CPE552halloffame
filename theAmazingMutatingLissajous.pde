/*

  Author: Joey Rupert

*/

void setup() {
  
  size(1000, 1000, P3D);
  
  frameRate = 60;
   
}

float n = 0;

float p = -50;

float q = 13;

float r = 15;

boolean hasReached = false;

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
    
  }
 
    if ((p <= 50) && (hasReached == false)) { 
      
      p += .01;
    
    } else if ((p >= 50) && (hasReached == false)) {
    
      hasReached = true;
    
    } else if ((p >= -50) && (hasReached == true)) {
    
      p -= .01;
    
    } else if ((p <= -50) && (hasReached == true)) {
    
      hasReached = false;
    
    }
    
  n += .01;
    
}
