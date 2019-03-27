int num =15;
float step, sz, offSet, theta, angle;

void setup() {
  size(600, 400);
  strokeWeight(5);
  step = 25 ;
}

void draw() {
  background(20);
  translate(width/2, height*.75);
  angle=0;
  for (int i=0; i<num; i++) {
    stroke(255-20*i,0+20*i,30+25*i);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  colorMode(RGB);
  resetMatrix();
  theta += .0523;
  
}
