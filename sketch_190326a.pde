void setup(){
  size(1000,1000);
  background(255);
  frameRate(100000000);
}
  float x1=500;
  float y1=500;
  float x2=500;
  float y2=500;
  float t=0;
  float k=5;
void draw(){
  strokeWeight(5);
  x1=k*t*cos(t)+500;
  y1=k*t*sin(t)+500;
  point(x1,y1);
  if(t<=200){
    t+=0.005;
  }
  x2=k/2*t*sin(t)+500;
  y2=k/2*t*cos(t)+500;
  //point(x2,y2);  

}
