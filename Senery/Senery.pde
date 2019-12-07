void setup(){
  size(420,300);
}
void scenery(){
  //sky
  fill(223,251,228);
  noStroke();
  arc(210,190,340,360,PI,PI+PI,CHORD);
  //sun
  fill(239,238,190);
  noStroke();
  ellipse(130,90,75,75);
  fill(248,221,150);
  noStroke();
  ellipse(130,90,60,60);
  
  //mountain
  fill(180,244,222);
  noStroke();
  arc(320,200,80,200,PI,PI+PI,CHORD);
  arc(200,200,60,150,PI,PI+PI,CHORD);
  fill(156,232,206);
  noStroke();
  arc(160,200,70,110,PI,PI+PI,CHORD);

  
  fill(138,218,189);
  noStroke();
  arc(80,200,120,120,PI,PI+PI, CHORD);
  arc(245,200,130,140,PI,PI+PI, CHORD);
  arc(315,195,30,40,PI,PI+PI, CHORD);
  arc(360,200,80,80,PI,PI+PI, CHORD);
  
  //river
  fill(203,247,212);
  noStroke();
  ellipse(10,200,5,10);
  rect(10,195,400,10);
  ellipse(410,200,5,10);
  
  ellipse(40,210,5,10);
  rect(40,205,310,10);
  ellipse(350,210,5,10);
  
  ellipse(30,220,5,10);
  rect(30,215,280,10);
  ellipse(310,220,5,10);
  
  ellipse(100,230,5,10);
  rect(100,225,170,10);
  ellipse(270,230,5,10);
  
  ellipse(330,230,5,10);
  rect(330,225,45,10);
  ellipse(375,230,5,10);
  
  ellipse(70,240,5,10);
  rect(70,235,240,10);
  ellipse(310,240,5,10);
  
  ellipse(120,250,5,10);
  rect(120,245,130,10);
  ellipse(250,250,5,10);
  
  ellipse(40,260,5,10);
  rect(40,255,250,10);
  ellipse(290,260,5,10);
  
  ellipse(130,270,5,10);
  rect(130,265,90,10);
  ellipse(220,270,5,10);
  
  fill(255,255,255);
  noStroke();
  ellipse(80,210,5,10);
  rect(80,205,30,10);
  ellipse(110,210,5,10);
  
  ellipse(200,230,5,10);
  rect(200,225,30,10);
  ellipse(230,230,5,10);
  
  ellipse(235,250,10,10);
  
}
void boat1() {
  fill(237,253,255);
  noStroke();
  triangle(165+x1, 215, 195+x1, 165, 195+x1, 215);
  triangle(195+x1, 220, 195+x1, 160, 225+x1, 205);
  
  fill(60, 162, 176);
  noStroke();
  ellipse(210+x1, 225, 88, 2);
  ellipse(210+x1, 230, 60, 2);
  ellipse(195+x1, 193, 3, 70);
  ellipse(180+x1, 215, 25, 2);
  
  fill(126, 94, 62);
  noStroke();
  ellipse(230+x1, 213, 8, 8);
  
  fill(60, 162, 176);
  noStroke();
  rect(225+x1, 213, 10, 12, 3);
  
  fill(247, 194, 112);
  noStroke();
  ellipse(230+x1, 207, 8, 5);
  ellipse(230+x1, 209, 20, 3); 
}
void boat2() {
  fill(237,253,255);
  noStroke();
  triangle(305-x2, 200, 315-x2, 185, 315-x2, 200);
  triangle(315-x2, 203, 315-x2, 180, 323-x2, 198);
  
  fill(60, 162, 176);
  noStroke();
  ellipse(310-x2, 200, 10, 1);
  ellipse(317-x2, 205.8, 18, 2);
  ellipse(315-x2, 195, 2, 23);
  ellipse(317-x2, 205, 20, 2);
}
void cloud1(){
  fill(255,255,255);
  ellipse(60+cx1,120,24,30);
  ellipse(88+cx1,120,50,45);
  ellipse(110+cx1,120,20,30);
  
}
void cloud2(){
  fill(255,255,255);
  ellipse(255-cx2,60,28,28);
  ellipse(270-cx2,60,35,35);
  ellipse(285-cx2,60,16,24);
}

float x1 = 0;
float x2 = 0;
float cx1 = 0;
float cx2 = 0;
float theta = 0;
void draw(){
  background(255,255,255);
  scenery();
  cx1 = 80 * sin(theta); 
  cloud1();
  cx2 = 100 * sin(theta);
  cloud2();
  x1 = 150 * sin(theta);
  boat2();
  x2 = 350 * sin(theta);
  boat1();
  theta += 0.002;

}
