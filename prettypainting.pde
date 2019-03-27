/*
Author: Gabriella Tantillo
"I pledge my honor that I have abided by the stevens honors system"
*/
int BOX;
float r=0;
void setup(){
 size(800,800);
 BOX = width/16;
 noStroke();
}
 public void Box(int x,int y,int w,int h, float r){
             translate(x+BOX/2,y+BOX/2);
             rotate(r);
            rect(x,y,w,h);
            resetMatrix();
        }

public void draw(){
  //background(0);
  for (int i = 0; i<17; i++) {
            for(int j = 0; j<17; j++){
            int x = i*BOX;
            int y = j*BOX;
            if((i+j)%2 == 0){
                fill(255);
            }
            else{
                fill(0);
            }
             Box(x,y,BOX,BOX,r);
             r+=0.5;
            } 
        }
       
}
