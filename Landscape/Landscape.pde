/**
  Dynamic Landscape Background
  Author: Ziran Gong
  CITE: Casablanca
*/

float theta, step;  
int num=5, frames = 1200;  
Mountain[] layers = new Mountain[num];  //

void setup() {  
  size(600, 400);  
  step = (height-120)/num;  
  for (int i=0; i<num; i++) {  
    layers[i] = new Mountain(-20+i*step, random(1000), i+1);
  }
}  

void draw() {  
  background(#ffffff);  
  for (int i=0; i<layers.length; i++) {  
    color col = lerpColor(#0B3C19, #ffffff, 0.8-0.8/num*i);  
    fill(col);  
    layers[i].display();
  }  
  theta += TWO_PI/frames;  

  //if (frameCount%2==0 && frameCount<=frames) saveFrame("image-###.gif");
}  

class Mountain {  

  float start, noize, speed;  
  float y1, y2;  

  Mountain(float _start, float _noize, float _speed) {  
    start = _start;  
    noize = _noize;  
    speed = _speed;
  }  

  void display() {  
    y1 = y2;  
    noStroke();  
    for (int x=0; x<width; x+=1) {  
      float y = start + noise(noize+sin(y1)*3)*step*3.5;  
      rect(x, height, 1, -height+y);  
      y1+=TWO_PI/(width);
    }  
    y2=theta*speed;
  }
}  
