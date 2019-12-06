float X;
float Y;
float Heading = 0;

void setup() {
  size(600, 600);
  X = width/2;
  Y = height/2;
  background(100,80,26);
}

void draw() {

  stroke(random(256), random(256), random(256));
  
  rotateTurtle(random(360));
  float length = random(0, 150);
  
  forward(length);
  rotateTurtle(180);
  
  forward(length);
  rotateTurtle(180);
 
  forward(length);
  rotateTurtle(180);
  
  forward(length);
}

void forward(float amount) {
  
  float newX = X + cos(radians(Heading)) * amount;
  float newY = Y + sin(radians(Heading)) * amount;

  line(X, Y, newX, newY);
  fill(0);
  
  X = newX;
  Y = newY;
}

void rotateTurtle(float degrees) {
  Heading += degrees;
}
