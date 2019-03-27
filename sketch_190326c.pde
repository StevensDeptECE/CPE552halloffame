int nb=750; // number of drops
int maxDrops =1000;
int minDrops=500;
int h,h1;
Drop[] drops=new Drop[maxDrops];

void setup(){
  colorMode(RGB,255);
  size(900,625,P3D);
  smooth();
  frameRate(30);
  h = abs(height/3);
  h1=h*2;
  for (int i = 0; i < maxDrops; i++){
    drops[i] = new Drop(int(random(width)),-int(random(height*2)),(int)map((h+int(random(h1))),height*.35,height,0,height),1280); 
  }
}

void draw(){
    fill(255,255,255);
  stroke(255);
  strokeWeight(0.5);
  line(0,180,900,180);
  strokeWeight(2);
  line(50,625,400,181);
  line(850,625,500,181);
 
  quad(435,600,440,480,460,480,465,600);
  quad(442,430,445,330,460,330,463,430);
  quad(447,285,448,215,457,215,458,285);
 
  gradient();
  for (int i=0;i<nb;i++){
    drops[i].fall();

  }
}


void gradient(){
  noStroke();
  beginShape(QUADS);
  fill(188,190,192); 
  vertex(0,0); 
  vertex(width,0);
  fill(0,5,10); 
  vertex(width,height); 
  vertex(0,height);
  endShape(); 
}

class Drop{
  int x,y,d,z,onde,d1,oldY;
  float acc;
  boolean s;

  Drop(int x,int y, int z, int d){
    this.x=x;
    this.y=y;
    this.d=d;
    this.z=z;
    onde=0;
    d1=d;
    acc=0;
    oldY=y;
  }

  void fall(){
    if(y>0)acc+=0.2;
    stroke(200,200,200,map(z,0,height,0,255));
    strokeWeight(1);
    if (y<z){
      y=int(y+4+acc);
      line(x,oldY,x,y);
      oldY=y;
    }
    else{
      
     noFill();
      stroke(175,175,175,175-map(onde,0,d,0,255));
      strokeWeight(map(onde,0,d,0,4));
      d=d1+(y-height)*4;
      ellipse(x,y,onde/5,onde/20);
      onde=onde+7;
      if(onde>d){
        onde=0;
        acc=0;
        x=int(random(width));
        y=-int(random(height*2));
        oldY=y;
        d=d1;
      }
    }
  }
}
