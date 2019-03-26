/*
Author: Weibin Ma
Title: Hair of the black hole
Date: 03/20/2019

*/


class Hair{
float anA, anB,len;
float x,y,z,X,Y,Z;
  Hair(float a, float z, float l){
    anA = a;
    anB = asin(z/radius);
    len = l;
    
    x = radius * cos(anB)*cos(anA);
    y = radius * cos(anB)*sin(anA);
    this.z=z;
    
    float offlen = radius +len;
    X = offlen *cos(anB)*cos(anA);
    Y = offlen *cos(anB)*sin(anA);
    Z = offlen *sin(anB);
  }
  void display(){
    line(x,y,z,X,Y,Z);
  }
}
