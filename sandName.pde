boolean jump;
boolean p1, p2, p3, p4;
Block quadCube;
boolean[]status=new boolean[4];
PFont yahei;

void setup() {
size(720, 360);
background(0);
frameRate(30);
yahei=createFont("haha.vlw", 160);
textFont(yahei);
fill(255);
text("Hao Cao", 50, 200);
}

void draw() {
if (jump==false) {
for (int i=0; i<width-1; i+=2) {
for (int j=0; j<height-1; j+=2) {

if (get(i, j)==color(255)) {
p1=true;
} else {
p1=false;
}
if (get(i+1, j)==color(255)) {
p2=true;
} else {
p2=false;
}
if (get(i, j+1)==color(255)) {
p3=true;
} else {
p3=false;
}
if (get(i+1, j+1)==color(255)) {
p4=true;
} else {
p4=false;
}
quadCube=new Block(p1, p2, p3, p4);
status=quadCube.output();

if (status[0]==true) {
set(i, j, color(255));
} else {
set(i, j, color(0));
}
if (status[1]==true) {
set(i+1, j, color(255));
} else {
set(i+1, j, color(0));
}
if (status[2]==true) {
set(i, j+1, color(255));
} else {
set(i, j+1, color(0));
}
if (status[3]==true) {
set(i+1, j+1, color(255));
} else {
set(i+1, j+1, color(0));
}
}
}
jump=true;
} else {

for (int i=1; i<width-1; i+=2) {
for (int j=1; j<height-1; j+=2) {
if (get(i, j)==color(255)) {
p1=true;
} else {
p1=false;
}
if (get(i+1, j)==color(255)) {
p2=true;
} else {
p2=false;
}
if (get(i, j+1)==color(255)) {
p3=true;
} else {
p3=false;
}
if (get(i+1, j+1)==color(255)) {
p4=true;
} else {
p4=false;
}
quadCube=new Block(p1, p2, p3, p4);
status=quadCube.output();

if (status[0]==true) {
set(i, j, color(255));
} else {
set(i, j, color(0));
}
if (status[1]==true) {
set(i+1, j, color(255));
} else {
set(i+1, j, color(0));
}
if (status[2]==true) {
set(i, j+1, color(255));
} else {
set(i, j+1, color(0));
}
if (status[3]==true) {
set(i+1, j+1, color(255));
} else {
set(i+1, j+1, color(0));
}
}
}
jump=false;
}
}

class Block {
boolean s1, s2, s3, s4;
float possibility=35f;
boolean result[]=new boolean[4];

Block(boolean i1, boolean i2, boolean i3, boolean i4) {
if (i1==false && i2==false && i3==false && i4==false) {
s1=false;
s2=false;
s3=false;
s4=false;
} else if (i3==true && i4==true) {
s1=i1;
s2=i2;
s3=i3;
s4=i4;
} else if (i1==true && i2==true && i3==false && i4==true) {
s1=false;
s2=true;
s3=true;
s4=true;
} else if (i1==true && i2==true && i3==true && i4==false) {
s1=true;
s2=false;
s3=true;
s4=true;
} else if (i1==true && i2==false && i3==true && i4==false) {
s1=false;
s2=false;
s3=true;
s4=true;
} else if (i1==false && i2==true && i3==false && i4==true) {
s1=false;
s2=false;
s3=true;
s4=true;
} else if (i1==true && i2==true && i3==false && i4==false) {
float odd=random(100);
if (odd>50) {
s1=true;
s2=true;
s3=false;
s4=false;
} else {
s1=false;
s2=false;
s3=true;
s4=true;
}
} else if (i1==true) {
s1=false;
s2=false;
s3=true;
s4=false;
} else if (i2==true) {
s1=false;
s2=false;
s3=false;
s4=true;
} else {
s1=i1;
s2=i2;
s3=i3;
s4=i4;
}
}

boolean[] output() {
boolean[]result= {
s1, s2, s3, s4
};
return result;
}
}
