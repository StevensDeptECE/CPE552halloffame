//author: Ruijie Zhai

color BG;
color Fl;

void setup(){
  size(800, 800,P3D);
  colorMode(HSB, 360, 100, 100, 100);
  BG = color(180, 0, 95);

  Fl = color(215, 95, 99,15);
  frameRate(30);
}

void draw(){
  background(BG);
  translate(width/2, height/2);
  noStroke();
  

  for(int i= 0; i<36; i++){
    pushMatrix();
    rotate(radians(10*i));
    fill(Fl);
    rect(20, -10, 150, 180);
    popMatrix();
  }
  
  int z=0;
  rotateZ(z);
  z+=100;

}
