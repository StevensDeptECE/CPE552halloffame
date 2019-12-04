
Stars [] s ;
PImage [] texture ;
Planet sun ;
float ang ; 
void setup(){
  
  ang = random(PI);
  s = new Stars[150];
  texture = new PImage[4];
  texture[0] = loadImage("sun.jpg");
  sun = new Planet(50,0,0,texture[0]);
  texture[1] = loadImage("mercury.jpg");
  texture[2] = loadImage("venus.jpg");
  texture[3] = loadImage("earth.jpg");
  
  sun.moon1(2,1);
  sun.moon(1,1);

}
void settings(){
size(800,800,P3D);

}

void draw(){
  
  background(0);
 // lights();
  stroke(255);
  fill(255);
  translate(width/2,height/2);
  sun.orbit(); 
  sun.orbit1();
  for(int i= 0 ; i< s.length;i++){
    
    s[i] = new Stars();
    rotate(ang);
    s[i].display();
  
  
  
  }
 
  sun.show1();
  sun.show();

}
 
