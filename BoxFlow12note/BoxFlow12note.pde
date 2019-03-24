import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

FFT         fft;
Minim   minim;
AudioPlayer bgm;  //背景音乐

Box[] boxes;  //盒子
Flow[] flow;  //线

int boxLen;   //盒子数量
int flowLen;  //线条数量

float band[]; //用到的频段的设置的响应阈值
JSONArray json, jsonf;  //盒子和线条分别的位点信息
int dragAvertex = -1;  //鼠标拖拽flag

boolean debug = true;   //调试状态
PImage bg;  //没用到

long stTime;
int musicState=0;
color bassColor;

void setup() {
  //size(1024, 768, P3D);
  //size(1280, 800, P3D);
  fullScreen(P3D);
  colorMode(HSB);
  //blendMode(ADD);
  ini();  //封装的初始设置 读位点信息等

  strokeWeight(5);
  strokeCap(ROUND);

  stTime = millis();
  bassColor = color(random(255), random(80, 120), 255);
}

void draw() {
  //musicState是针对现在这首曲子，做的分段的编号，不同的段落，颜色反应的状态风格不同
  //主要颜色风格有两大类，盒子统一颜色时不时一起变，或盒子每个颜色不一样
  //println((millis()-stTime)*0.001);
  if(musicState==0 & (millis()-stTime)*0.001>12)musicState=1;
  if(musicState==1 & (millis()-stTime)*0.001>34)musicState=2;
  //if(musicState==2 & (millis()-stTime)*0.001>33)musicState=3;
  //if(musicState==3 & (millis()-stTime)*0.001>47)musicState=4;
  if(musicState==4 & (millis()-stTime)*0.001>56)musicState=5;
  
  //在奇数段落运行此条件内的效果
  if(musicState%2==1){
    boolean allDark = true;
    for (int i=0; i<boxLen; i++) {
      //if (i==0 || i==1 || i==2 || i==3 || i == 11 || i ==10 || i==9 || i==14 || i==15 || i==16 || i==5 || i==8) {
        //盒子的整体颜色会随机切换，切换时盒子最好都是暗下来的状态，不然变化会显得突兀
        if(boxes[i].alp[0]>20 || boxes[i].alp[1]>20 || boxes[i].alp[2]>20){
          allDark = false;
          break;
        }
      //}
    }
    
    //
    if(allDark & random(1)<0.5){
      bassColor = color(random(255), random(80, 120), 255);
      //println("new colorrrr");
    }
  }
  
  background(0);
  //音乐从头循环的时候，重置各参数
  if (millis()-stTime>(82)*1000) {
    musicState=0;
    stTime=millis();
    bgm.rewind();
    flowLen=0;
  }
  //音乐开始阶段，线条逐渐加入
  if (flowLen<jsonf.size() & frameCount%6==0 & random(1)<0.1) { 
    JSONObject data = jsonf.getJSONObject(flowLen);
    int vnum = (data.size()-1)/2;
    PVector[] pv = new PVector[vnum];
    for (int j=0; j<pv.length; j++) {
      String xx = "vertex " + j + " x";
      String yy = "vertex " + j + " y";
      pv[j] = new PVector(data.getInt(xx), data.getInt(yy));
    }
    flow[flowLen] = new Flow(pv, int(random(800, 1200)*vnum));
    flowLen++;
    println("flow num:" +flowLen);
  }
  
  //音乐收尾阶段，线条逐渐变少
  if((millis()-stTime)*0.001>50){
  for (int i=0; i<flowLen; i++) {
  if(flow[i].now==0 & flow[i].stt==0){
  for(int j=i;j<flowLen-1;j++){
   flow[j] = flow[j+1];
  }
  flowLen--;
  }
  }
  }

  if (debug) {
    //rect(0,0,1024,768);
    //image(bg, 0, 0, width, height);
  }
  //println(mouseX, mouseY);

  fft.forward( bgm.mix );  
  //println(fft.getBand(95));

  for (int i=0; i<boxLen; i++) {  //显示box
   boxes[i].show();
   boxes[i].drag();
  }

  for (int i=0; i<flowLen; i++) {  //debug控制线条流动和显示
    flow[i].drag();
    if (!debug)flow[i].move();
    if (debug)flow[i].display();
  }
}
