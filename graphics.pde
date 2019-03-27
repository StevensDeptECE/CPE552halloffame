
int particleCount = 17000;
Particle[] particles = new Particle[particleCount+1];

void setup() 
{
  size(800,600);
  colorMode(RGB, 255);
  stroke(123, 104, 238);
  frameRate(20);
  for (int x = particleCount; x >= 0; x--) { 
    particles[x] = new Particle();
  }

}

void draw()
{

  translate(width/2, height/2);
  background(0);
  float turn = 0;

  if (mousePressed) 
    turn = (mouseX - pmouseX) * 0.00001;
  for (int i = particleCount; i >= 0; i--) { 
    Particle particle = (Particle) particles[i];
    particle.update(turn);
  } 
}


class Particle {
  float angle;
  float radius;
  PVector previous = new PVector();
  float dec;
  float tilt;
  float turnVelocity;
  Particle() {
      fill(255,255,255,2);

    angle = random(50,1000) * 0.03;
    radius = random(2,200);
    tilt = random(0,50);
    dec = (200 - radius) * 0.00004;
    
  }

  void update (float turn) {
    PVector current = new PVector(radius * cos(angle)*1.2, tilt + 5 * cos(angle + 3.5), radius * sin(angle)*1.2);
    if (turn != 0)
      turnVelocity = turn * (501-radius);
    angle -= dec + turnVelocity;
    turnVelocity *= 0.90;
    if (previous.x == 0) {
      previous.set(current);
    }
    isoLine(current,previous,angle);
    previous.set(current);
  }
}  
void isoLine(PVector begin, PVector end, float angle) {
  PVector newBegin = new PVector(int(begin.x - begin.z), int((begin.x + begin.z)/2 - begin.y));
  PVector newEnd = new PVector(int(end.x - end.z), int((end.x + end.z)/2 - end.y));
stroke(106, 90, 205,100);
     strokeWeight(1.3);
 
  line (newBegin.x, newBegin.y, newEnd.x, newEnd.y);
}
