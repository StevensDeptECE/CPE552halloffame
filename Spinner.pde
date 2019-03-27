float t;
float ball1x =0;
float ball1y =0;
float ball2x =0;
float ball2y =0;

void setup() {
  frameRate(25);
  background(20);
  size(720,720);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(1);
  translate(width/2, height/2);
  rotate (radians(t));
  
  for (int i=0;i<100; i++){
    
  stroke(100,100,100,i*20);
   
  //draw ball1
  ball1x=x3(t+i);
  ball1y=y3(t+i);
  noStroke();
  fill(255,255,0,i*8);
  ellipse(ball1x,ball1y,i/5,i/5);
  
  ball2x=x4(t+i);
  ball2y=y4(t+i); 
  noStroke();
  fill(255,255,0,i*8);
  ellipse(ball2x,ball2y,i/5,i/5);
  
  stroke(255,255,0,i*8);
  line(ball1x,ball1y,ball2x,ball2y);
   
  }
  t += 2;  
  
}

float x1(float t) {
  return cos(t/10) *100;
}

float y1(float t ) {
  return sin(t/10) *100;  
}

float x2(float t) {
  return sin(t/10) *200;
}

float y2(float t ) {
  return cos(t/10) *200;  
}

float x3(float t) {
  return cos(t/10) *240;
}

float y3(float t ) {
  return sin(t/10) *100;  
}

float x4(float t) {
  return cos(t/10) *100;
}

float y4(float t ) {
  return sin(t/10) *-320;  
}
