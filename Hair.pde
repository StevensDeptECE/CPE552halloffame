class Hair{
  float angleA,angleB,len,offLen;
  float x,y,z,X,Y,Z;
  Hair(float a ,float z, float l){
    angleA = a;
    angleB = asin(z/radius);
    len = l;
    x = radius * cos(angleB) * cos(angleA);
    y = radius * cos(angleB) * sin(angleA);
    this.z = z;
    offLen = radius + len;
    X = offLen * cos(angleB) * cos(angleA);
    Y = offLen * cos(angleB) * sin(angleA);
    Z = offLen * sin(angleB);
  }
void display(){
  line(x,y,z,X,Y,Z);
}
}
