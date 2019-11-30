/*
Author: Michael DiGregoiro

Conceptually inspired by Queen Bee Art's Swarm Circles
https://www.openprocessing.org/sketch/376739
*/



class Dot{
   public PVector pos, vel, acc;
   float dx, dy;
   
  Dot(){
   pos = new PVector(random(width), random(height)); 
   vel = new PVector(0,0);
   acc = new PVector(0,0);
   dx = 0;
   dy = 0;
  }
  void drawDot(int r, int g, int b){
    fill(r, g, b);
    circle(pos.x, pos.y, 9);
  }
  void update(){
    dx = -(pos.x - mouseX);
    dy = -(pos.y - mouseY);
    acc = new PVector(dx, dy);
    acc.limit(.4);
    vel.add(acc);
    vel.limit(8);
    pos.add(vel);
}
}

Dot swarm[] = new Dot[50];

void setup(){
  size(500,500);
  background(255,255,255);
  for(int i = 0; i < swarm.length; i++){
     swarm[i] = new Dot();
  }
}

void draw(){
  fill(255,255,255,45);
  rect(0,0,width,height);
  int[] r = {212, 170,0};
  int[] g = {175, 169, 0};
  int[] b = {55, 173, 0};
  strokeWeight(1);
  for(int i = 0; i < swarm.length; i++){
     swarm[i].update();
     if(i % 3 == 0){
       swarm[i].drawDot(r[0], g[0], b[0]);
     }
     else if(i % 3 == 1){
       swarm[i].drawDot(r[1], g[1], b[1]);
     }
     else{
       swarm[i].drawDot(r[2], g[2], b[2]);
     }
  }
  strokeWeight(1);
  if(swarm.length %2 == 0){
   for(int i = 0; i < swarm.length-1; i++){
     
    if(i % 3 == 0){
       stroke(r[0], g[0], b[0]);
     }
     else if(i % 3 == 1){
       stroke(r[1], g[1], b[1]);
     }
     else{
       stroke(r[2], g[2], b[2]);
     }
    line(swarm[i].pos.x, swarm[i].pos.y, swarm[i+1].pos.x, swarm[i+1].pos.y);
    println(i);
   }
  }
}
