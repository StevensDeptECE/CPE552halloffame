// Alyson Randall
// click mouse to draw

int[] x_point = new int[1000]; 
int[] y_point = new int[1000];
int points = 0; 
 
void setup()
{
  size(900,900);
  background(0);
  frameRate(100);
}
 
void draw()
{
  int red = int(random(255));
  int green = int(random(255));
  int blue = int(random(255));
  color rand_color = color(red, green, blue);
  for (int i=0; i < points; i++)
  {
    fill(rand_color);
    ellipse(x_point[i], y_point[i], random(100), random(100));
  }
}
 
void mouseClicked()
{
  x_point[points] = mouseX;
  y_point[points] = mouseY;
  points++;
}
