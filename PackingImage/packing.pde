ArrayList<Square> squares;
PImage img;
public void settings(){
  size(600,600);
}
void setup() {
  
  img = loadImage("test3.jpg");
  img.loadPixels();
  squares = new ArrayList<Square>();
}

void draw() {
  background(0);

  int total = 10;
  int count = 0;
  int attempts = 0;

  while (count <  total) {
    Square newS = newSquare();
    if (newS != null) {
      squares.add(newS);
      count++;
    }
    attempts++;
    if (attempts > 1000) {
      noLoop();
      println("FINISHED");
      break;
    }
  }


  for (Square c : squares) {
    if (c.growing) {
      if (c.edges()) {
        c.growing = false;
      } else {
        for (Square other : squares) {
          if (c != other) {
            float d = dist(c.x, c.y, other.x, other.y);
            if (d - 2 < c.r + other.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
    c.grow();
  }
}

Square newSquare() {

  float x = random(width);
  float y = random(height);

  boolean valid = true;
  for (Square c : squares) {
    float d = dist(x, y, c.x, c.y);
    if (d < c.r) {
      valid = false;
      break;
    }
  }

  if (valid) {
    int index = int(x) + int(y) * img.width;
    color col = img.pixels[index];
    return new Square(x, y, col);
  } else {
    return null;
  }
}
