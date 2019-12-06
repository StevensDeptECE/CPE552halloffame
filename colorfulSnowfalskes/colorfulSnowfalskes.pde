int densityNum = 100; 
float[] x= new  float[densityNum];
float[] y= new  float[densityNum];

float[] speed = new float[densityNum];
float[] pointZ = new float[densityNum];

float[] size = new float[densityNum];
float colorNumR = 0f;
float colorNumG = 0f;
float colorNumB = 0f;
void setup() {
  //fullScreen(P3D);
  size(400, 400, P3D);
  background(0);
  stroke(255);
  strokeWeight(5);
  
  int i = 0;
  while (i < densityNum) {  
    x[i] = random(0, width);
    y[i] = random(0, height);
    speed[i] = random(1, 5);
    pointZ[i] = random(-50, 50);
    size[i] = random(4, 7);
    i = i + 1;
  }
}
void draw() {
 
  background(0);
  int i = 0;
  while (i < densityNum) {
    colorMode(HSB,255,255,255);
    float r = map(speed[i],1,5,0,255);
    float g = map(speed[i],1,5,0,255);
    float b = map(speed[i],1,5,0,255);
    println(60,60,60);
    stroke(r, g, b);
    strokeWeight(size[i]);
    point(x[i], y[i], pointZ[i]);
 
    y[i] = y[i] + speed[i];
    if (y[i] > height) {
      y[i] = 0;
    }
    i = i + 1;
  }
}
