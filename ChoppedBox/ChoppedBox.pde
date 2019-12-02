/*Siyang Wu*/
/*Reference: Coding Challenge #2 from Coding Train*/
/*Do not forget to press the mouse*/
class Box {
PVector Pos; // Object
float Size;

// constructor
Box(float x, float y, float z, float size) {
  Pos = new PVector(x, y, z); // set the position
  Size = size; // Size of the box
}

ArrayList<Box> generate() { // method
  ArrayList<Box> boxes = new ArrayList<Box>();
  for (int x = -1; x < 2; x ++) {
    for (int y = -1; y < 2; y ++) {
      for (int z = -1; z < 2; z ++) {
         int sum = abs(x) + abs(y) + abs(z);
         float NewS = Size / 3;
         if(sum <= 1) {
         Box b = new Box(Pos.x + x * NewS, Pos.y + y * NewS, Pos.z + z * NewS, NewS);
         boxes.add(b);
      }
    }
  }
 }
  return boxes;
}

void show() {
  pushMatrix(); 
  translate(Pos.x, Pos.y, Pos.z);
  noStroke();
  fill(255 - Pos.x, 255 - Pos.y, 255 - Pos.z);
  box(Size);
  popMatrix();
  }
}

float a = 0;
ArrayList<Box> Sponge;

void setup(){
    size(800, 800, P3D);
    Sponge = new ArrayList<Box>();
    Box b = new Box(0, 0, 0, 400);
    Sponge.add(b);
}

void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : Sponge) {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  Sponge = next;
}

void draw(){
  background(100, 100, 255);
  stroke(255, 0, 0);
  noFill();
  lights();
  translate(width / 2, height / 2);
  rotateX(a);
  rotateY(a * 0.2);
  rotateZ(a * 0.1);
  for (Box b: Sponge) { // in front of the box
  b.show();
  }
  a = a + 0.01;
}
  
