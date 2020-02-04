float circle = 200;
float circle1 = 500;
float rot = 10;
float rot2 = 10;
float freq = 0.000005;
float freq1 = 0.000005; 
float r;
float r1;
float col;
float col1;
void setup() {
  size(1200, 1200);
}

void draw() {
  background(220);
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
    background(220);
  translate(300, 100);
  rotate(radians(rot2));

 ellipseMode(RADIUS);
  for (int i1=0; i1<1200; i1 ++) {
    circle1= 230 + 150*sin(millis()*freq1*i1);
    col1=map(circle,150,180,255,60);
    r1=map(circle,150,250,5,2);
    fill(col,0,90);
    noStroke();
    ellipse(circle*cos(i1), circle*sin(i1),r,r);    
    rot=rot+0.00005;
  }
}
