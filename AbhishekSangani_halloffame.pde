float turtleX;
float turtleY;
float turtleHeading = 0;

void setup() {
  size(1000, 1000);
  turtleX = width/2;
  turtleY = height/2;
  background(100,34,56);
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
  
  float newX = turtleX + cos(radians(turtleHeading)) * amount;
  float newY = turtleY + sin(radians(turtleHeading)) * amount;

  line(turtleX, turtleY, newX, newY);
  fill(0);
  
  turtleX = newX;
  turtleY = newY;
}

void rotateTurtle(float degrees) {
  turtleHeading += degrees;
}
