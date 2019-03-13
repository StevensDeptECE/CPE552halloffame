/*
  Wanying Cao
*/
PShape rain, head, body; 
int l=80;
Rainy []r= new Rainy[l];
int count=0;
void setup() {
  size(1000, 600);
  background(0, 0, 50);
  frameRate(10);
  for (int i=0; i<l; i++) {
    r[i]= new Rainy(random(width), 0);
  }
  //setDefaultCloseOperation(EXIT_ON_CLOSE);
}
class Rainy {
  private float x, y;
  public Rainy(float x, float y) {
    this.x=x;
    this.y=y;
  }

  public void Shape() {
    rain = createShape(GROUP);
    ellipseMode(CORNER);
    noStroke();
    head= createShape(TRIANGLE, x, 20+y, x+15, 20+y, x+7.5, y);
    head.setFill(color(0, 0, 150));
    body= createShape(ARC, x, y+10, 15, 20, 0, PI);
    body.setFill(color(0, 0, 150));
    rain.addChild(head);
    rain.addChild(body);
    shape(rain);
  }

  public void RShape() {
    rain = createShape(GROUP);
    ellipseMode(CORNER);
    noStroke();
    head= createShape(ARC, x, y-10, 15, 20, PI, 2*PI);
    head.setFill(color(0, 0, 150));
    body= createShape(TRIANGLE, x, y, x+15, y, x+7.5, y+20);
    body.setFill(color(0, 0, 150));   
    rain.addChild(head);
    rain.addChild(body);
    shape(rain);
  }

  public void setY(float y) {
    this.y=y;
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}

void drop() {
}

void wave(Rainy r[], int i, float b) {
  ellipseMode(CENTER);
  for (int j=2; j>0; j--) {
    fill(0, 0, b);
    stroke(0, 0, (3-j)*((150-b)/3+b));
    ellipse(r[i].getX(), r[i].getY()+40, 30*j, 10*j);
  }
}

void mousePressed() {
  count++;
}

float y=0.0;
float dy=0.5;
int t=1, b=150;
void draw() {
  if (count%3==0) {
    if (b>50) {
      b-=t;
    }
    background(0, 0, b);
    for (int i=0; i<l; i++) {
      if (y>height-30) {
        //print(y+" "+dy);
        y=0;
        dy=0.5;
        wave(r, i, b);
      }
      dy+=0.2;
      y+=dy;
      r[i].setY(y);
      r[i].Shape();
    }
  } else if (count%3==1) {
    background(0, 0, b);
    for (int i=0; i<l; i++) {
      fill(0, 0, 150);
      stroke(255);
      ellipse(r[i].getX(), r[i].getY(), 20, 20);
    }
  } else {
    if (b<150) {
      b+=t;
    }
    background(0, 0, b);
    for (int i=0; i<l; i++) {
      if (y<30) {
        y=576.7;
        dy=15.1;
      }
      dy-=0.2;
      y-=dy;
      r[i].setY(y);
      r[i].RShape();
    }
  }
}
