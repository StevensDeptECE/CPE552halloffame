/*
Hints:- use UP/DOWN/LEFT/RIGHT to control speed.
      - use Q/E/W/S/A/D to control camera.
Author:
Tianfeng Du

*/



final float change_to_rad = PI / 180;
PShape sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto;
PImage isun, imercury, ivenus, iearth, imars, ijupiter, isaturn, iuranus, ineptune, ipluto;
float speed = 0.1;
float mspeed = 1;
float[] spin_speed = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] spin_speed_data = {speed/2.4, speed/5.8, speed/24.3, speed/0.1, speed/0.1, speed/0.05, speed/0.04, speed/1, speed/0.1, speed/0.6};
float[] revolution_speed = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float[] revolution_speed_data = {0, speed/8.8, speed/22.4, speed/36.5, speed/68.7, speed/433, speed/1075, speed/(365*8.4), speed/(365*16), speed/(24*365)};
float[] location = {500, 500, 300, 0, 350, 0, 400, 0, 450, 0, 500, 0, 550, 0, 600, 0, 650, 0, 700, 0};
float[] inclination = {0.1, 7, 3.4, 0, 1.9, 1.3, 2.5, 0.8, 1.8, 17};
float eyex = 2000;
float eyey = 0;
float eyez = 0;
float centerx = 500;
float centery = 500;
float centerz = 0;



void setup(){
  
  size(1000, 1000, P3D);
  camera(eyex, eyey, eyez, centerx, centery, centerz, 0, 1, 0);
  
  background(0);
  noStroke();
  isun = loadImage("sun.jpg");
  imercury = loadImage("mercurymap.jpg");
  ivenus = loadImage("venusmap.jpg");
  iearth = loadImage("earthmap1k.jpg");
  imars = loadImage("mars_1k_color.jpg");
  ijupiter = loadImage("jupitermap.jpg");
  isaturn = loadImage("saturnmap.jpg");
  iuranus = loadImage("uranusmap.jpg");
  ineptune = loadImage("neptunemap.jpg");
  ipluto = loadImage("plutomap1k.jpg");
  
  sun = createShape(SPHERE, 200);
  mercury = createShape(SPHERE, 5);
  venus = createShape(SPHERE, 10);
  earth = createShape(SPHERE, 10);
  mars = createShape(SPHERE, 5);
  jupiter = createShape(SPHERE, 50);
  saturn = createShape(SPHERE, 40);
  uranus = createShape(SPHERE, 20);
  neptune = createShape(SPHERE, 20);
  pluto = createShape(SPHERE, 5);
  
  sun.setTexture(isun);
  mercury.setTexture(imercury);
  venus.setTexture(ivenus);
  earth.setTexture(iearth);
  mars.setTexture(imars);
  jupiter.setTexture(ijupiter);
  saturn.setTexture(isaturn);
  uranus.setTexture(iuranus);
  neptune.setTexture(ineptune);
  pluto.setTexture(ipluto);
  
  frameRate(60);
}

void draw(){
  /*
  if(mousePressed == true){
    camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  }
  */
  camera(eyex, eyey, eyez, centerx, centery, centerz, 0, 1, 0);
  background(0);
  
  pushMatrix();
    translate(location[0], location[1]);
    rotateX(90 * change_to_rad);
    rotateY(inclination[0] * change_to_rad);
    rotateZ(spin_speed[0]);
    shape(sun);
    spin_speed[0] += mspeed*spin_speed_data[0];
  popMatrix();
        
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[1] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 600, 600);
    rotateZ(revolution_speed[1]);
    translate(location[2], location[3], 0);
    rotateZ(spin_speed[1]);
    shape(mercury);
    spin_speed[1] += mspeed*spin_speed_data[1];
    revolution_speed[1] += mspeed*revolution_speed_data[1];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[2] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 700, 700);
    rotateZ(revolution_speed[2]);
    translate(location[4], location[5], 0);
    rotateZ(spin_speed[2]);
    shape(venus);
    spin_speed[2] -= mspeed*spin_speed_data[2];
    revolution_speed[2] += mspeed*revolution_speed_data[2];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[3] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 800, 800);
    rotateZ(revolution_speed[3]);
    translate(location[6], location[7], 0);
    rotateZ(spin_speed[3]);
    shape(earth);
    spin_speed[3] += mspeed*spin_speed_data[3];
    revolution_speed[3] += mspeed*revolution_speed_data[3];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[4] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 900, 900);
    rotateZ(revolution_speed[4]);
    translate(location[8], location[9], 0);
    rotateZ(spin_speed[4]);
    shape(mars);
    spin_speed[4] += mspeed*spin_speed_data[4];
    revolution_speed[4] += mspeed*revolution_speed_data[4];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[5] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 1000, 1000);
    rotateZ(revolution_speed[5]);
    translate(location[10], location[11], 0);
    rotateZ(spin_speed[5]);
    shape(jupiter);
    spin_speed[5] += mspeed*spin_speed_data[5];
    revolution_speed[5] += mspeed*revolution_speed_data[5];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[6] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 1100, 1100);
    rotateZ(revolution_speed[6]);
    translate(location[12], location[13], 0);
    rotateZ(spin_speed[6]);
    shape(saturn);
    spin_speed[6] += mspeed*spin_speed_data[6];
    revolution_speed[6] += mspeed*revolution_speed_data[6];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[7] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 1200, 1200);
    rotateZ(revolution_speed[7]);
    translate(location[14], location[15], 0);
    rotateZ(spin_speed[7]);
    shape(uranus);
    spin_speed[7] -= mspeed*spin_speed_data[7];
    revolution_speed[7] += mspeed*revolution_speed_data[7];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[8] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 1300, 1300);
    rotateZ(revolution_speed[8]);
    translate(location[16], location[17], 0);
    rotateZ(spin_speed[8]);
    shape(neptune);
    spin_speed[8] += mspeed*spin_speed_data[8];
    revolution_speed[8] += mspeed*revolution_speed_data[8];
  popMatrix();
  
  pushMatrix();
    translate(location[0], location[1], 0);
    rotateX(90 * change_to_rad);
    rotateY(inclination[9] * change_to_rad);
    noFill();
    stroke(204, 102, 0);
    ellipse(0, 0, 1400, 1400);
    rotateZ(revolution_speed[9]);
    translate(location[18], location[19], 0);
    rotateZ(spin_speed[9]);
    shape(pluto);
    spin_speed[9] -= mspeed*spin_speed_data[9];
    revolution_speed[9] += mspeed*revolution_speed_data[9];
  popMatrix();
  
}
/*
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  eyex += 10 * e;
  eyey -= 10 * e;
  println(e);
}
*/
void keyPressed() {
  
  if (keyCode == UP) {
       mspeed += 0.1;
  }
  if (keyCode == DOWN) {
       mspeed -= 0.1;
  }
  if (keyCode == LEFT) {
       mspeed -= 0.01;
  }
  if (keyCode == RIGHT) {
       mspeed += 0.01;
  }
  if (keyCode == 'W') {
       eyex -= 10;
  }
  if (keyCode == 'S') {
       eyex += 10;
  }
  if (keyCode == 'A') {
       eyez += 10;
  }
  if (keyCode == 'D') {
       eyez -= 10;
  }
  if (keyCode == 'Q') {
       eyey += 10;
  }
  if (keyCode == 'E') {
       eyey -= 10;
  }
  
 
}
