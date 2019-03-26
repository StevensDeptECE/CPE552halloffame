/**
  Create Beautiful Graphics
  Author: Chi Wai Kuok

  
*/

int cx, cy;

float lx, ly;
float lx2, ly2;
float mx, my;
float mx2, my2;
float j;
float k;

float chaosValue;
float speedValue;

void setup() {
  size(1000, 1000);
  stroke(255);
  
  cx = width / 2;
  cy = height / 2;
  
  j = 0;
  chaosValue = 0;
  speedValue = 0.01;
}

void draw() {
  background(0);
  
  translate(cx, cy);
  for (int i = 0; i < 40; i++)
  {
  j += speedValue;
  strokeWeight(3);
  stroke(155,0,chaosValue);
  
  // Mouse position will change the equations
  lx = cos((j + i)/ (mouseY % 200)) * 400; 
  ly = sin((j + i)/ 10) * 400;
  lx2 = sin((j + i)/ 5) * 400;
  ly2 = cos((j + i)/ (mouseX % 200)) * 400;
  line(lx, ly, lx2, ly2);
  
  k += speedValue;
  // strokeWeight(k % 10);
  stroke(chaosValue,0,155);
  mx = -sin((k + i)/ 7) * 200 -sin((k + i)/ 7) * 200;
  my = -cos((k + i)/ (mouseX % 200)) * 200 -sin((k + i)/ 30) * 200;
  mx2 = cos((k + i)/ 10) * 400;
  my2 = cos((k + i)/ (mouseY % 200)) * 400;
  line(mx, my, mx2, my2);
  }
}

// Mouse drag will change the color
void mouseDragged(){
  chaosValue += 0.1;
  if (chaosValue > 255)
  {
    chaosValue = 0; 
  }
}

// Mouse click will change the speed
void mouseClicked(){
  speedValue += 0.001;
  if (speedValue > 0.1)
  {
    speedValue = 0.001; 
  }
}
