/*Author John Brescia
I pledge my honor That I have abidied by the Stevens Honor System. John Brescia

Gabi Tantillo uploaded this for me because I do not have access to push on this reposotory.

*/
float t;
float u;

void setup() {
 background(20);
 size(800,800);
}
void draw() {
  stroke(255);
  strokeWeight(5);
  
  translate(width/2,height/2);

  point(x(t), y(t));
;
  point (-x(t), -y(t));

  point(a(t), b(t));
 
  point (-a(t), -b(t));
  t++;
 
  
}


float x(float t) {
  return sin(t/10) * 100 ;
}
float y(float t) {
  return t;//cos(t/10)* 100;
}
float a(float t) {
  return t;
}
float b(float t) {
  return sin(t/10)*100; //cos(t/10)* 100;
}
  
