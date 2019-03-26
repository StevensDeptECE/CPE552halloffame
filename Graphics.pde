
float x;
float y;
float R;
float p1;
float p2;
float c=0;

void setup()  {
  size(800, 600);
  frameRate(10);
}

void draw()  {
  background(135 - c * 65, 206 - c * 75, 250 - c * 75);
  //background(5, 57, 100);
  if(c >= 2){
    c = 0;
  }else{
    c += 0.03;
  }
  noStroke();
  fill(0,8+8*cos(PI*c),16,75);
  rect(0,0,800, 600);
  strokeWeight(1);
  stroke(255,200,100);
  for(int i=0;i<20;i++){
    x = random(800);
    y = random(600);
    beginShape();
    fill(255,200,100);
    for(int j=0;j<10;j++){
      if (j%2 == 0){
        R = 10;
      }else{
        R = 5;
      }
      p1 = R * cos(PI*j/5) + x;
      p2 = R * sin(PI*j/5) + y;
      vertex(p1,p2);
    }
    endShape();
    line(p1,p2+3,p1-40,p2-40*cos(PI/6));
  }  
  
  stroke(255, 255, 0);
  fill(255, 255, 0);
  ellipse(0 + c * 400, 0, 150, 150);
  
  stroke(255);
  fill(255);
  ellipse(50,80,250,30);
  ellipse(20,60,110,25);
  ellipse(500,350,250,30);
  ellipse(530,330,110,25);
  stroke(200);
  fill(200);
  quad(150, 100, 450, 100, 450, 600, 150, 600);
  quad(220, 50, 370, 50, 370, 100, 220, 100);
  stroke(150);
  fill(150);
  quad(150, 100, 250, 100, 250, 600, 150, 600);
  quad(220, 50, 270, 50, 270, 100, 220, 100);
  stroke(255);
  fill(255);
  quad(270, 120, 430, 120, 430, 150, 270, 150);
  quad(270, 170, 430, 170, 430, 200, 270, 200);
  quad(270, 220, 430, 220, 430, 250, 270, 250);
  quad(270, 270, 430, 270, 430, 300, 270, 300);
  quad(270, 320, 430, 320, 430, 350, 270, 350);
  quad(270, 370, 430, 370, 430, 400, 270, 400);
  quad(270, 420, 430, 420, 430, 450, 270, 450);
  quad(270, 470, 430, 470, 430, 500, 270, 500);
  quad(270, 520, 430, 520, 430, 550, 270, 550);
}
