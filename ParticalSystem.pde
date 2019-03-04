/*
  Author: Peihong Yu
  
  Left click to randomly change particale's color
  
*/

import java.util.Iterator;

final float GRAVITY = -0.1;
final boolean MOTION_BLUR = false;
int blue_change = 0;
int red_change = 0;
ParticleSystem system = new ParticleSystem();

void setup() {
  background(0);
  size(750, 750);
}

void draw() {
  background(0);
  system.update();
}

void mouseMoved() { 
  system.particles.add(new Particle(new PVector(mouseX, mouseY)));
  system.particles.add(new Particle(new PVector(mouseX, mouseY)));
  system.particles.add(new Particle(new PVector(mouseX, mouseY)));
}


void mousePressed() {
  blue_change = (int)random(0, 255);
}


class ParticleSystem {

  ArrayList<Particle> particles = new ArrayList<Particle>();

  void update() {
    Iterator<Particle> i = particles.iterator();
    while (i.hasNext()) {
      Particle p = i.next();

      if (p.pos.x > width || p.pos.x < 0) {
        i.remove();
        continue;
      } else if (p.pos.y > height || p.pos.y < 0) {
        i.remove();
        continue;
      }
      p.applyForce(PVector.random2D());
      p.move();

      if (p.isDead()) {
        i.remove();
      } else {
        p.display();
      }
    }
    
  }
  
}

class Particle {
  final static float BOUNCE = -0.5;
  final static float MAX_SPEED = 1;

  PVector vel = new PVector(random(-MAX_SPEED, MAX_SPEED), random(-MAX_SPEED, MAX_SPEED));
  PVector acc = new PVector(0, 0);
  PVector pos;

  float mass = random(2, 2.5);
  float size = random(0.1, 2.0);
  float r, g, b;
  int lifespan = 255;

  Particle(PVector p) {
    pos = new PVector (p.x, p.y);
    acc = new PVector (random(0.1, 1.5), 0);
    r = random (100, 255);
    g = random (0, 50);
    b = blue_change;
  }


  public void move() {
    vel.add(acc); 
    pos.add(vel); 
    acc.mult(0);

    size += 0.01; 
    lifespan -= 3;
  }

  public void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  public void display() {
    fill(constrain(abs(this.vel.y) * 100, 0, 255), constrain(abs(this.vel.x) * 100, 0, 255), b, lifespan);
    ellipse(pos.x, pos.y, size * 4, size * 4);
  }

  public boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
