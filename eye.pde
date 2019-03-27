/*
 *author Haoyu Sun 
 *15/3/2019
 * when the yellow ball moving close to the eye ,the eye will become smaller; 
 */
void setup (){
  size(1000,1000);
  
  strokeWeight(5);
  stroke(0,255,0);
}

float x = 0 , y = 0, dx = 3 , dy = 3;

void draw(){
  fill(240,220,0);
  ellipse(x,y,50,50);
  fill(0,0,0,10);
  rect(0,0,width,height);
  
  x += dx;
  y += dy;
  if( x < 0 || x+80 > width){
    dx = -dx;
  }
  if(y < 0 || y+40 > height){
    dy = -dy;
    
    
  }
  
  float d = dist(x+40, y+20,500,500);
  strokeWeight(d/15);
  fill(255);
  ellipse(500,500,d*1.25,d*0.75);
  strokeWeight(d/20);
  fill(0,0,255);
  ellipse(500,500,d/2,d/2);
  fill(0);
  noStroke();
  ellipse(500,500,d/4,d/4);
  
}
