/* 
  Author: Zhi Chen
  This is a smulation of a 2D raining scene.
  You use mouse clicks to pause/play the scene.
*/

class RainDrop{
  private float w,h,x,y,v;
  private void initialize(){
    this.w = random(3);
    this.h = random(50);
    this.x = random(900);
    this.y = 0;
    this.v = random(15, 20);
  }
  
  private void splash(){
    int n = (int)random(10);
    for(int i = 0; i < n; i++){
      fill(255);
      ellipse(x + random(-20, 20), 360 - random(10), random(1, 7), random(1, 7));
      noStroke();
    }
  }
  
  public RainDrop(){
   initialize();
  }
  
  public void drop(){
    fill(random(150, 250));
    ellipse(x, y, w, h);
    noStroke();
    if(y <= 360 - h){
      y += v;
    }
    else{
      splash();
      initialize();
    }
  }
}

ArrayList<RainDrop> generateSeed(){
  int n = (int)random(150, 200);
  ArrayList<RainDrop> seed = new ArrayList<RainDrop>();
  for(int i = 0; i < n; i++){
    seed.add(new RainDrop());
  }
  return seed;
}

ArrayList<RainDrop> seed = generateSeed();
boolean pause = false;

void setup(){
  size(900,450);
}

void draw(){
  background(100);
  fill(50);
  rect(0,360,899,449);
  noStroke();
  for(int i = 0; i < seed.size(); i++){
    seed.get(i).drop();
  }
}

void mouseClicked(){
  if(pause){
    loop();
    pause = false;
  }
  else{
    noLoop();
    pause = true;
  }
}
