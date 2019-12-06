float circle = 200;
float rot = 10;
float freq = 0.000005; 
float r;
float col;
void setup() {
  size(600, 600);
}

void draw() {
  background(242);
  translate(300, 300);
  rotate(radians(rot));

 ellipseMode(RADIUS);
  for (int i=0; i<800; i ++) {
    circle= 230 + 150*sin(millis()*freq*i);
    col=map(circle,150,180,255,60);
    r=map(circle,150,250,5,2);
    fill(col,0,90);
    noStroke();
    ellipse(circle*cos(i), circle*sin(i),r,r);    
    rot=rot+0.00005;
  }
}
