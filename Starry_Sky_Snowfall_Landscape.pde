/*
 Author      : Monami Mukhopadhyay
 Program     : Starry Sky/Snowfall Landscape
 Description : This program basically shows a landscape with buildings, sky and moon. When the program is run at first, 
               it displays a starry sky with twinkling stars. But as soon as any key(exceptions are SHIFT,CTRL,ALT key) is pressed
               on the keyboard(keyPressed function), the landscape immediately changes to snowfall happening. When the key is released, the display goes 
               back to the starry sky again.
*/

float [] xPosition = new float[300];
float [] yPosition = new float[300];
int [] flakeSize = new int[300];
int [] direction = new int[300];
float[] xPos = new float[250];
float[] yPos = new float[250];
float[] xVel = new float[250];
float[] yVel = new float[250];
float[] s = new float[250]; 
int minFlakeSize = 1;
int maxFlakeSize = 6;

int a = 0;
int b = 0;
int c = 100;
int p = 10;

void setup() {
  size(800, 600);
  frameRate(10);
  noStroke();
  smooth();
  
  for (int i=0; i < 250; i++) {
    xPos[i] = random(1, 799);
  }

  for (int i=0; i < 250; i++) {
    yPos[i] = random(1, 599);
  }

  for (int i=0; i < 250; i++) {
    xVel[i] = random(-10, 10);
  }

  for (int i=0; i < 250; i++) {
    yVel[i] = random(-10, 10);
  }
  
  for (int i=0; i < 250; i++) {
    s[i] = random(1, 6);
  }
}

void draw() {
  background(25,25,112);
  if(keyPressed == false){
  smooth ();
  noStroke ();
  background(0);
  line (a, b, c, a);
  a = a + 5;
  if (a == 600) {
    a = 0;
    c = c +100;
    b = b +100;
  }
  stroke (255);
  
  for (int i=0; i < 250; i++) {
    line (xPos[i]+p, yPos[i], xPos[i], yPos[i]);
    line (xPos[i], yPos[i]+p, xPos[i], yPos[i]);
    line (xPos[i], yPos[i], xPos[i]-p, yPos[i]);
    line (xPos[i], yPos[i], xPos[i], yPos[i]-p);
    if (a > yPos[i]-25) {
      p = 5;
    }
    if (a < yPos[i]+25) {
      p = 5;
    }
    if (a < yPos[i]-25) {
      p = 0;
    }
    if (a > yPos[i]+25) {
      p = 0;
    }
    i = i + 1;
  }
  
  for (int i=0; i < 250; i++) {
    noStroke ();
    fill(255);
    ellipse(xPos[i], yPos[i], s[i], s[i]);
  }
  
  fill(252, 248, 4);
  ellipse(100, 100, 100, 100);//Moon
  
  fill(105,105,105);
  }else{
  fill(0);}
  
  rect(60, 400, 70, 200);//Building 1
  rect(130, 500, 80, 100);//Building 2
  rect(210, 480, 80, 120);//Building 3
  rect(320, 400, 80, 200);//Building 4  
  rect(400, 450, 100, 150);//Building 5
  rect(500, 400, 70, 200);//Building 6
  rect(630, 500, 100, 100);//Building 7
  rect(710, 480, 80, 200);//Building 8
  fill(252, 248, 4);
  for(int i=410;i<600;i=i+40){ //Windows
    rect(80,i,20,20);
  }
  for(int i=510;i<600;i=i+40){
    rect(160,i,20,20);
  }
  for(int i=490;i<600;i=i+40){
    rect(240,i,20,20);
  }
  for(int i=410;i<600;i=i+40){
    rect(350,i,20,20);
  }
  for(int i=460;i<600;i=i+40){
    rect(420,i,20,20);
  }
  for(int i=460;i<600;i=i+40){
    rect(470,i,20,20);
  }
  for(int i=410;i<600;i=i+40){
    rect(530,i,20,20);
  }
  for(int i=510;i<600;i=i+40){
    rect(660,i,20,20);
  }
  for(int i=490;i<600;i=i+40){
    rect(740,i,20,20);
  }
}

void keyPressed(){
  fill(205,205,193);
  ellipse(100, 100, 100, 100);//Moon
  fill(25,25,112);
  ellipse(120,70,100,100);
  fill(255);
  for(int i=410;i<600;i=i+40){//Windows
    rect(80,i,20,20);
  }
  for(int i=510;i<600;i=i+40){
    rect(160,i,20,20);
  }
  for(int i=490;i<600;i=i+40){
    rect(240,i,20,20);
  }
  for(int i=410;i<600;i=i+40){
    rect(350,i,20,20);
  }
  for(int i=460;i<600;i=i+40){
    rect(420,i,20,20);
  }
  for(int i=460;i<600;i=i+40){
    rect(470,i,20,20);
  }
  for(int i=410;i<600;i=i+40){
    rect(530,i,20,20);
  }
  for(int i=510;i<600;i=i+40){
    rect(660,i,20,20);
  }
  for(int i=490;i<600;i=i+40){
    rect(740,i,20,20);
  }
  fill(255);
  ellipse(600,580,40,40);//Snowman
  ellipse(600,550,30,30);
  ellipse(600,530,20,20);
  fill(0);
  ellipse(594,530,5,5);
  ellipse(604,530,5,5);
  ellipse(599,540,5,5);
  ellipse(599,546,5,5);
  ellipse(599,552,5,5);
  rect(580,517,40,7);
  rect(590,507,20,20);
  fill(255,69,0);
  ellipse(599,535,8,8);
  
  for(int i = 0; i < 300; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  fill(255);
  for(int i = 0; i < xPosition.length; i++) {
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    yPosition[i] += flakeSize[i] + direction[i]; 
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
  }
}
