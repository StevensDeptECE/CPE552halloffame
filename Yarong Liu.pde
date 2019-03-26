/*Author: Yarong Liu
  Function: draw nine grids and eveyone contains particular shape
  */


void setup(){
  size(600,600);
  frameRate(15);
}
float ra ,rb,rc,rd,re,rf,rg,rh;
float ratio = 0.0, qratio1 = 0,qratio2 = 0,c,a,l1,l2,l3,l4;
int  count = 60, Nframe = 0,y=0;
void draw(){
  background(255); //<>//
  circle();
  ring();
  line();
  cross();
  bounce();
  Orcircle();
  Rcircle();
  voice();
  Cquad();
  Nratio();
}

void circle(){
  fill(0);
  if (ra<=10){ra = 10;}
  ellipse(100,100,ra,ra);
}

void ring(){
  if(c<0.6){y= y+10;stroke(y);}
  else{stroke(0);strokeWeight(c);y=0;};
  noFill();
  ellipse(300,100,rb,rb);
}

void line(){
  fill(0);
  noStroke();
  rect(497,140-rc, 6,50);
}

void cross(){
  noStroke();
  fill(0);
  push();
  translate(100,300);
  rotate(radians(rd));
  rect(-3,-20,6,40);
  rect(-20,-3,40,6);
  pop();
}

void bounce(){
  fill(0);
  ellipse(300+a,300+re,30,30);
}

void Orcircle(){
  fill(0);
  push();
  translate(500,300);
  rotate(radians(rf));
  ellipse(0,-20,10,10);
  ellipse(0,20,10,10);
  pop();
}
 
void Rcircle(){
  stroke(0);
  strokeWeight(1.5);
  fill(255);
  ellipse(100,500,50,50+rg);
}

void voice(){
  fill(0);
  quad(265,550-l1,275,550-l1,275,550,265,550);
  quad(285,550-l2,295,550-l2,295,550,285,550);
  quad(305,550-l3,315,550-l3,315,550,305,550);
  quad(325,550-l4,335,550-l4,335,550,325,550);
  l1 = random(0,100*qratio2);
  l2 = random(0,100*qratio2);
  l3 = random(0,100*qratio2);
  l4 = random(0,100*qratio2);
}

void Cquad(){
  stroke(0);
  strokeWeight(1.5);
  fill(255);
  quad(480-rh,500,500,470-rh,520+rh,500,500,530+rh);
}

void Nratio(){
  Nframe = frameCount % count;
  ratio = Nframe / 60.0;
  qratio1 = pow(ratio-1,2);
  qratio2= pow(ratio-1, 4);
  
  c = 5*qratio2;
  rb =100*(1-qratio1);
  
  ra =100*qratio1;
  
  rc = rc + 10*qratio2;
  if(rc>=120){rc = 0;}
  
  rd = rd + 7.8*qratio2;
  if(rd>=90){rd = 0;}
  
  re = 30-100*ratio+50*ratio*ratio;
  a = random(-10*qratio1,10*qratio1);
  
  rf = 180*qratio2;
  
  rg = 50*(1-qratio1);
  rh = 20*(1-qratio1);
    
}
