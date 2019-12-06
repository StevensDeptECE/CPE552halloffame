float angle, step;  
int num=7, frames = 2000;  
Layer[] layers = new Layer[num];  //

void setup() {  
  size(600, 600);  
  step = (height-150)/num;  
  for (int i=0; i<num; i++) {  
    layers[i] = new Layer(-20+i*step, random(1000), i+1);
  }
}  

void draw() {  
  background(255);  
  for (int i=0; i<layers.length; i++) {  
    color col = lerpColor(#4A14C1, #ffffff, 1-0.5/num*i);  
    fill(col);  
    layers[i].show();
  }  
  angle += TWO_PI/frames;  

  
}  

class Layer {  

  float start, noize, speed;  
  float y1, y2;  

  Layer(float start, float noize, float speed) {  
    this.start = start;  
    this.noize = noize;  
    this.speed = speed;
  }  

  void show() {  
    y1 = y2;  
    noStroke();  
    for (int x=0; x<width; x+=1) {  
      float y = start + noise(noize+sin(y1)*6)*step*3;  
      rect(x, height, 1, -height+y);  
      y1+=TWO_PI/(width);
    }  
    y2=angle*speed;
  }
}  
