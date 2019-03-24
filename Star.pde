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
   fill(mouseX,mouseY,255);
   rect(sx,sy,8,8);
  }
}
