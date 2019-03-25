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

class Hair{
  float angleA,angleB,len,offLen;
  float x,y,z,X,Y,Z;
  Hair(float a ,float z, float l){
    angleA = a;
    angleB = asin(z/radius);
    len = l;
    x = radius * cos(angleB) * cos(angleA);
    y = radius * cos(angleB) * sin(angleA);
    this.z = z;
    offLen = radius + len;
    X = offLen * cos(angleB) * cos(angleA);
    Y = offLen * cos(angleB) * sin(angleA);
    Z = offLen * sin(angleB);
  }
void display(){
  line(x,y,z,X,Y,Z);
}
}
class Star{
  float x;
  float y;
  float z;
  float sx;
  float sy;
  Star(){
    x = random(-width,width);
    y = random(-height,height);
    z = width;
  }  
void update(){
   z = z - 10;
   if(z < 1){
   z = width;
   x = random(-width,width);
   y = random(-height,height);
 }
}
void show(){
   fill(255);
   noStroke();
   sx = map(x/z,0,1,0,width);
   sy = map(y/z,0,1,0,height);
   fill(mouseX,mouseY,255-mouseX);
   rect(sx,sy,8,8);
  }
}
