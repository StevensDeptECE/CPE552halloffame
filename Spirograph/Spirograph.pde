/**
  Create Beautiful Graphics - Spirograph
  Author: Zihao Pan
*/
int r0 = 170;//Variable. Size of the large circle.
void setup()
{
  size(800,800);
  fill(255,255,255); 
  stroke(0,0,0);
}
float r1 = 130;//Variable. Radius of the small circle.
float r2 = 65;//Variable. Radius of the tiny circle.
float x = r0;
float y = r0 - r1;//Initial center of the small circle
float theta = 0;
float a;
int i = 0;
float[] x1 = new float[100000];
float[] y1 = new float[100000];
void draw()
{
  background(255,255,255);
  ellipse(r0,r0,2*r0,2*r0);//Radius of the large circle is 100;
  x = r0 + (r0 - r1) * cos(theta);
  y = r0 + (r0 - r1) * sin(theta);//center of the small circle
  a = r0 / r1 * theta;
  x1[i] = x + r2 * cos(-a);
  y1[i] = y + r2 * sin(-a);//Record the point.
  ellipse(x,y,r1*2,r1*2);//Draw the small circle.
  line(x1[i],y1[i],x,y);
  for(int j=0;j<=i-1;j++){
    line(x1[j],y1[j],x1[j+1],y1[j+1]);
  }
  //if(i % 2000 == 1999){
  //  r2 = random(r1);
  //}
  theta += 0.01 * PI;
  i++;
}
