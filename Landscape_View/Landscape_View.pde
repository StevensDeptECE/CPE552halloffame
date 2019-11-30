//EE552 HW Create Beautiful Graphics
//Weitai Wen
//
//Based on Sketch "Landscape Drawing" By Ashley Hall
//https://www.openprocessing.org/sketch/401843
//


void setup() {
  size(1200, 650);
  background(153,206,235);
  
//sun
  fill(255,255,224);
  noStroke();
  ellipse(600,100,110,110);  
  fill(255,170,0);
  noStroke();
  ellipse(600,100,100,100);
  

//cloud left
  fill(247,247,247);
  int sx = 70, sy = 50, sr = 90;
  ellipse(sx, sy, sr, sr);
  ellipse(sx - sr/3, sy, 0.7 * sr, 0.7 * sr);
  ellipse(sx + sr/3, sy, 0.7 * sr, 0.7 * sr);
  ellipse(sx - sr/3, sy * 1.6, 0.5 * sr, 0.5 * sr);
  ellipse(sx + sr/3, sy * 1.6, 0.5 * sr, 0.5 * sr);
  ellipse(sx - sr/2, sy * 1.6, sr, sr);
  ellipse(sx + sr/2, sy * 1.6, sr, sr);
  ellipse(sx , sy * 1.6, sr, sr);
  ellipse(sx, sy * 0.7 , 0.4 * sr, 0.4 * sr);
  
  int x = 350, y = 100 , r = 100;
  fill(247,247,247);
  ellipse(x, y, r, r);
  ellipse(x-r, y, r, r);
  ellipse(x+r, y, r, r);
  ellipse(x+r/2, y-r/2, r, r);
  ellipse(x-r/2, y-r/2, r, r);
  ellipse(x-r/2, y+r/2, r, r);
  ellipse(x+r/2, y+r/2, r, r);
  ellipse(x, y-0.7*r, r/2, r/2);
  ellipse(x, y+0.7*r, r/2, r/2);
  ellipse(x-r, y-0.3*r, r/2, r/2);
  ellipse(x+r, y+0.3*r, r/2, r/2);
  
//cloud right 
  int x2 = 900, y2 = 150, r2= 70;
  fill(247,247,247);
  ellipse(x2, y2, r2, r2);
  ellipse(x2-r2, y2, r2, r2);
  ellipse(x2+r2, y2, r2, r2);
  ellipse(x2+r2/2, y2-r2/2, r2, r2);
  ellipse(x2-r2/2, y2-r2/2, r2, r2);
  ellipse(x2-r2/2, y2+r2/2, r2, r2);
  ellipse(x2+r2/2, y2+r2/2, r2, r2);
  ellipse(x2, y2-0.7*r2, 0.7 * r2, 0.7 * r2);
  ellipse(x2, y2+0.7*r2, 0.7 *r2, 0.7 * r2);
  ellipse(x2-r2, y2-0.3*r2, r2/2, r2/2);
  ellipse(x2+r2, y2+0.3*r2, r2/2, r2/2);
  
  fill(247,247,247);
  int sx2 = 1070, sy2 = 50, sr2 = 90;
  ellipse(sx2, sy2, sr2, sr2);
  ellipse(sx2 - sr2/3, sy2, 0.7 * sr2, 0.7 * sr2);
  ellipse(sx2 + sr2/3, sy2, 0.7 * sr2, 0.7 * sr2);

//ground
  fill(57, 80, 69);
  noStroke();
  rect(0, 600, 1200, 50);
  filter(BLUR,1);

  fill(73, 100, 87);
  noStroke();
  rect(0, 615, 1200, 45);
  filter(BLUR,1);

  fill(96, 131, 114);
  noStroke();
  rect(0, 630, 1200, 20);
  filter(BLUR,1);
  
}

void draw() {
  
 //whiteMountain1
  fill(217, 243, 247);
  noStroke();
  triangle(600, 200, 100, 600, 1100, 600);
  //shadows
  fill(147,138,152);
  noStroke();
  triangle(600,200,100,600,600,600);
  fill(102, 133, 142);
  noStroke();
  triangle(600, 200, 100, 600, 450, 600);
  fill(51, 67, 71);
  noStroke();
  triangle(600, 200,100, 600, 275, 600);

//whiteMountain2 
  fill(217, 243, 247);
  noStroke();
  triangle(500, 225, 100, 600, 925, 600);
  //shadows
  fill(102, 133, 142);
  noStroke();
  triangle(500, 225, 100, 600, 512, 600);
  fill(51, 67, 71);
  noStroke();
  triangle(500, 225, 100, 600, 305, 600);
  
//whiteMountain3
  fill(217, 243, 247);
  noStroke();
  triangle(400, 250, 50, 600, 850, 600);
  //shadows
  fill(102, 133, 142);
  noStroke();
  triangle(400, 250, 50, 600, 450, 600);
  fill(51, 67, 71);
  noStroke();
  triangle(400, 250, 50, 600, 250, 600);

//leftWhiteMountain
  fill(217, 243, 247);
  noStroke();
  triangle(250, 300, 0, 600, 400, 600);
  fill(102, 133, 142);
  noStroke();
  triangle(250, 300, 0, 600, 200, 600);
  fill(51, 67, 71);
  noStroke();
  triangle(250, 300, 0, 600, 100, 600);

  //rightWhiteMountain 
  fill(217, 243, 247);
  noStroke();
  triangle(950, 275, 700, 600, 1200, 600);
  fill(51, 67, 71);
  noStroke();
  triangle(950,275, 690, 600, 800, 600);
  
//leftPurpleMountains 
    fill(147,138,152);
  noStroke();
  triangle(150,275,0,500,400,600);
  fill(98,83,106);
  noStroke();
  triangle(150,275,0,500,200,500);
  fill(49,42,53);
  noStroke();
  triangle(150,275,0,500,100,500);
  
  fill(98,83,106);
  noStroke();
  triangle(85,300,0,500,300,600);
  fill(49,42,53);
  noStroke();
  triangle(85,300,0,500,60,510);

//rightPurpleMountains(left-right)
  fill(147,138,152);
  noStroke();
  triangle(1000,250,800,600,1200,600);
  fill(98,83,106);
  noStroke();
  triangle(1000,250,800,600,950,600);
  fill(49,42,53);
  noStroke();
  triangle(1000,250,790,600,850,600);
  
  fill(147,138,152);
  noStroke();
  triangle(1075,275,850,600,1200,600);
  fill(98,83,106);
  noStroke();
  triangle(1075,275,850,600,950,600);
  
  fill(98,83,106);
  noStroke();
  triangle(1200,250,950,600,1200,600);
  fill(147,138,152);
  noStroke();
  triangle(1200,300,1100,600,1200,600);
  fill(49,42,53);
  noStroke();
  triangle(1200,250,1200,300,1025,600);
  
//orangeMountains
  fill(188,117,63);
  noStroke();
  triangle(825,225,600,600,1100,600);
  fill(147,138,152);
  noStroke();
  triangle(825,225,600,600,935,600);
  fill(98,83,106);
  noStroke();
  triangle(825,225,600,600,850,600);
  fill(49,42,53);
  noStroke();
  triangle(825,225,600,600,725,600);

  fill(188,117,63);
  noStroke();
  triangle(625,300,350,600,900,600);
  fill(98,83,106);
  noStroke();
  triangle(625,300,350,600,625,600);
  fill(49,42,53);
  noStroke();
  triangle(625,300,350,600,487.5,600);
  
//closerLeftWhiteMountains 
  fill(217, 243, 247);
  noStroke();
  triangle(0,500,0,600,300,450);
  fill(147,138,152);
  noStroke();
  triangle(0,500,0,550,300,450);
  fill(51, 67, 71);
  noStroke();
  triangle(0,500,0,525,300,450);
  
//closerRightWhiteMountain
  fill(217, 243, 247);
  noStroke();
  triangle(1200,500,1200,600,700,500);
  fill(147,138,152);
  noStroke();
  triangle(1200,500,1200,550,700,500);
  fill(51, 67, 71);
  noStroke();
  triangle(1200,500,1200,525,700,500);
  
//RightYellowMountain (right-left)
  fill(222,169,54);
  noStroke();
  triangle(1125,415,900,600,1175,600);
  //purpleShadow
  fill(49,42,53);
  noStroke();
  triangle(1075,455,1115,422,1150,600);

  //tallestYellow
  fill(222,169,54);
  noStroke();
  triangle(1035,300,900,600,1150,600);
  //purpleShadows
  fill(98,83,106);
  noStroke();
  triangle(1035,300,1025,600,975,435);
  fill(49,42,53);
  noStroke();
  triangle(1035,300,975,435,937.5,425);

  fill(222,169,54);
  noStroke();
  triangle(950,350,700,600,1150,600);
  //orangeShadow
  fill(188,117,63);
  noStroke();
  triangle(950,350,700,600,1037,600);
  //purpleShadows
  fill(98,83,106);
  noStroke();
  triangle(950,350,700,600,925,600);
  fill(49,42,53);
  noStroke();
  triangle(950,350,700,600,812,600);
  
  fill(222,169,54);
  noStroke();
  triangle(875,375,700,600,1000,600);
  //orangeShadow
  fill(188,117,63);
  noStroke();
  triangle(875,375,700,600,850,600);
  //purpleShadow
  fill(49,42,53);
  noStroke();
  triangle(875,375,700,600,800,600);
  
  fill(222,169,54);
  noStroke();
  triangle(800,400,600,600,900,600);
  //orangeShadow
  fill(188,117,63);
  noStroke();
  triangle(800,400,600,600,750,600);
  //purpleShadow
  fill(49,42,53);
  noStroke();
  triangle(800,400,600,600,700,600);

//leftYellowMountains 
  fill(222,169,54);
  noStroke();
  triangle(375,325,25,600,550,600);
  //orangeShadow
  fill(188,117,63);
  noStroke();
  triangle(375,325,25,600,375,600);
  //purpleShadows
  fill(98,83,106);
  noStroke();
  triangle(375,325,25,600,288,600);
  fill(49,42,53);
  noStroke();
  triangle(375,325,25,600,156,600);
  
  fill(222,169,54);
  noStroke();
  triangle(275,425,100,600,400,600);
  //purpleShadows
  fill(147,138,152);
  noStroke();
  triangle(275,425,100,600,250,600);
  fill(98,83,106);
  noStroke();
  triangle(275,425,100,600,175,600);
 
 //orangleYellowSmallMountains
   //smallYellow
   fill(222,169,54);
   noStroke();
   triangle(550,500,450,600,650,600);
   //orangeShadow
   fill(188,117,63);
   noStroke();
   triangle(550,500,450,600,550,600);
   //purpleShadow
   fill(49,42,53);
   noStroke();
   triangle(550,500,450,600,500,600);
   
   //smallPurple
   fill(98,83,106);
   noStroke();
   triangle(955,425,870,600,1040,600);
   //purpleshadow
   fill(49,42,53);
   noStroke();
   triangle(955,425,870,600,912,600);
   
   //smallOrange
   fill(188,117,63);
   noStroke();
   triangle(1055,475,975,600,1135,600);
   //purpleShadow
   fill(49,42,53);
   noStroke();
   triangle(1055,475,975,600,1055,600);
}
