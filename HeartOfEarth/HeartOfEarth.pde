/*
Author: Weibin Ma
Title: heart of earth
Date: 03/21/2019
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Read Me:
Need to import Minim libary and PeasyCam libary. 
Need to load an image data and a music data.
You can rotate the view by draging the mouse.
The color of core will change every 2s.
Following the music beat the core will change it's size.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/

import peasy.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

PeasyCam cam;
Minim minim;
AudioPlayer player;
FFT fft;

PShape earth;
float h;
int savedTime; 
int totalTime = 5000;
float radius = 100;
Hair[] hairs;
int hnum;
float l;




void setup(){
  size(800,800,P3D);
  
  noStroke();
  savedTime = millis(); 
  
  minim = new Minim(this);
  player = minim.loadFile("Welcome.mp3");
  player.loop();
  fft = new FFT(player.bufferSize(),player.sampleRate());
  
  PImage imageEarth = loadImage("earth.jpg"); 
  earth = createShape(SPHERE,200);
  earth.setTexture(imageEarth);
  cam = new PeasyCam(this,radius * 2.5);
  
  hnum = 5000;
  
 hairs = new Hair[hnum];
  l =15;
  for(int i = 0;i < hnum;i++){
    hairs[i] = new Hair(random(TWO_PI),random(-radius,radius),random(0.0,1.3*l));
  }
  
}
void earth(){
  
  shape(earth);

}

void draw(){
  
  fft.forward(player.left);
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime-3) { 

  fill(random(255),random(255),random(255)); 
  savedTime = millis(); 
  } 
  noStroke();
  beginShape();
  earth();
  for(int i = 0;i<480;i+=2){
  h = fft.getBand(i)*0.5;
  sphere(h*0.7);
   

 
  hairs[i] = new Hair(random(TWO_PI),random(-radius,radius),h*l);
  } 
  
  stroke(255);
  for(int i = 0; i < hnum;i++){
    hairs[i].display();
  }
}
