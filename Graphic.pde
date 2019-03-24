float radius = 200;
Hair[] hairs;
Star[] stars;
int num;
int mem;
float l;
final float n = 2*PI;
float tRx,tRy;
float rx,ry;
float easing = 0.05;
void setup(){
  size(800,600,P3D);
  num = 10000;
  mem = 400;
  hairs = new Hair[num];
  stars = new Star[mem];
  l = 15;
  for (int i = 0; i < num; i ++){
  hairs[i] = new Hair(random(n),random(-radius,radius),l);  
}
  for (int i = 0; i < mem; i ++){
  stars[i] = new Star(); 
}
}
void draw(){
background(0);
tRx = map(mouseY,0,height,0,n);
tRy = map(mouseX,0,width,0,n);
rx = (tRx - rx)*easing + rx;
ry = (tRy - ry)*easing + ry;
translate(width/2,height/2);
rotateX(-rx);
rotateY(-ry);
fill(mouseX,255-mouseY,255-mouseY);
noStroke();
sphere(radius);
stroke(255-mouseY,255-mouseX,mouseX);
for(int i = 0; i < num; i ++){
 hairs[i].display();
 }
noFill();
stroke(mouseY,255-mouseX,255-mouseY);
strokeWeight(3);
box(400);
for(int i = 0; i < mem; i ++){
stars[i].update();
stars[i].show();
}
 }
