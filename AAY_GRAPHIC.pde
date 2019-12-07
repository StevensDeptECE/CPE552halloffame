// Ahmet Ay 12/05/2019

void setup(){
size(800,800);
}

int delayS = 750;

void draw(){
  
 delayS -= 20;
 
 color bg = color(random(255),random(255),random(255));
 color fillC = color(random(255),random(255),random(255));
 
 if(delayS < 20)
   delay(5);
 else
   delay(delayS);
   
 background(bg);
 stroke(random(255),random(255),random(255));
 strokeWeight(10);
 
 float cX = random(100,700);
 float cY = random(100,700);
 
 line(0,0,cX,cY);
 
 line(800,800,cX,cY); 
 
 line(800,0,cX,cY); 
 
 line(0,800,cX,cY);
 
 line(400,0,cX,cY);
 
 line(800,400,cX,cY); 
 
 line(0,400,cX,cY); 
 
 line(400,800,cX,cY);
 
  circle(cX,cY,random(50,250));
  fill(fillC);
  
 circle(0,0,random(50,250));
 
 circle(800,800,random(50,250)); 
 
 circle(800,0,random(50,250)); 
 
 circle(0,800,random(50,250));
 
 circle(400,0,random(50,250));
 
 circle(800,400,random(50,250)); 
 
 circle(0,400,random(50,250)); 
 
 circle(400,800,random(50,250));
  
}
