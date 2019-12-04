// Author Zehui Xie
// Get inspire from https://blog.csdn.net/znyicen/article/details/52145190
import processing.sound.*;

 

SoundFile soundFile;  //  音频文件

AudioIn in;  //   AudioIn let's you grab the audio input from your soundcard

Amplitude amp;//  一个音频数据分析器

float lucency = 0;//  透明度

float ampvalue = 0; // Amplitude.analyze()的值

String path = "";// 文件路径（文件保存在项目目录中的“data”文件夹中）

 

void setup()

{  

  //initialize

  size(1300,700);//设置画布大小

  surface.setResizable(true);//使窗口画布大小可拖动调整

  pixelDensity(displayDensity());

  

  path = "Ring05.wav";

  soundFile = new SoundFile(this,path);
  
  soundFile.play();

  in = new AudioIn(this,0);

  amp = new Amplitude(this);

  

  in.start();  //   Starts the input stream

  amp.input(in);  //  Defines the audio input source of the amplitude analyzer

  

}

 

int lastm = 0;//保存毫秒millis()/60获取的商，用于减缓获取音频数据的时间

void draw()

{

  background(#1A191A);//设置背景画布颜色

  noStroke();//设置图形无线条

  

  //60毫秒获取一次amp分析音频的value

  int m = millis();//获取程序运行时间，以毫秒为单位

  if(m/60>lastm)//  "millis()/60 " > 上次获取的商

  {

    ampvalue = amp.analyze();//analyze()   Queries a value from the analyzer and returns a float between 0. and 1.

    lastm = m/60;

  }

  println("millis:"+m);

  println(ampvalue); 

  

  //绘制外圈紫色圆

  drawOutsideCircle(ampvalue);

  

  //绘制中心红色圆和紫色外圈的 分隔 白圈

  fill(random(255));

  ellipse(600,350,400,400);

  noFill();

  //绘制中心圆背景

  fill(random(255),random(255),random(255));

  ellipse(600,350,380,380);

  noFill();

  

  drawInsideCircle(ampvalue);

  //中心白圆

  fill(255);

  ellipse(600,350,50,50);

  noFill();

  

  //标题

  textSize(32);

  fill(255);

  text(path,30,40);

  noFill();

}

//绘制外圈紫色闪动圆函数

void drawOutsideCircle(float ampvalue)

{

  int wid = 500;//圆形直径

  lucency = ampvalue*10000;//根据amp分析的值value修改透明度（灰度值）

  fill(255,0,255,lucency);

  ellipse(600,350,wid,wid);

  noFill();

  //倒影

  fill(255,0,255,lucency/5);

  ellipse(600,650,wid,wid/10);

  noFill();

}

//绘制内圈红色变直径圆函数

void drawInsideCircle(float ampvalue)

{

  float wid = 100;//圆形直径

  wid = wid*ampvalue*100 + wid;

  if(wid>380)//防止直径越界

  wid = 380;

  

  //根据直径长度绘制中心红圆

  fill(255,0,0);

  ellipse(600,350, wid,wid);

  noFill();

  //倒影

  fill(255,0,0,80);

  ellipse(600,650, wid,wid/10);

  noFill();

  

  //ampvalue值圈形边界

  strokeWeight(5);

  stroke(0);

  ellipse(600,350, 200,200);

  ellipse(600,350, 300,300);

  noStroke();

  

}

//点击鼠标播放音乐

void mousePressed()

{

  soundFile.play();

}
