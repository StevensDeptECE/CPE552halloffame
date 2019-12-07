int n = 12000;

float[] m = new float[n];
float[] x = new float[n];
float[] y = new float[n];
float[] vx = new float[n];
float[] vy = new float[n];
float A;
float B;

void setup() {
  size(800,600);
  fill(0, 22);
  reset();
}

void draw() {
  noStroke();
  rect(0, 0, width, height);
  int t=second();
  if(t%4==0){
    reset();
    A=random(750);
    B=random(550);}
   else{
    for (int i = 0; i < n; i++) {
      float dx = A - x[i];
      float dy = B - y[i];
      float d = sqrt(dx*dx + dy*dy);
      if (d < 1) d = 1;
      float f = sin(d * 0.04);
      vx[i] = vx[i] * 0.5 + f * dx;
      vy[i] = vy[i] * 0.5 + f * dy;
    }

    for (int i = 0; i < n; i++) {
      x[i] += vx[i];
      y[i] += vy[i];

      if (x[i] < 0) x[i] = width;
      else if (x[i] > width) x[i] = 0;

      if (y[i] < 0) y[i] = height;
      else if (y[i] > height) y[i] = 0;

      if (m[i] < 0) stroke(128, 128, 255);
      else stroke(255, 255, 255);

      point(x[i], y[i]);
    }
  }
}

void reset() {
  for (int i = 0; i < n; i++) {
    m[i] = randomGaussian() * 16;
    x[i] = random(width);
    y[i] = random(height);
  }
}
