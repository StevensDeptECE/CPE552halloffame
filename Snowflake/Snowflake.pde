/*
   Author: Mengjie Min
   Cite : King Li
*/
import java.util.Iterator;

snowsystem snow;

void setup() 
{
  size(1280,1080);
snow =new snowsystem(0.6);  
}
void draw() 
{
  background(30);
  stroke(255);
  snow.run();  
}

class Branch  
{
 float radius,ratio,rotation;
 Branch(float radius_,float ratio_,float rot){
  radius=radius_;
  ratio=ratio_;
  rotation=rot;
}
 void generate()
{
   pushMatrix();
   rotate(radians(rotation)); 
   float len=getStartLength(radius,ratio);
   branch(len);
   popMatrix();
 }
 void branch(float len)
{
     strokeWeight(len*0.3); 
     strokeCap(ROUND);      
     line(0,0,0,-len);             
     translate(0,-len);           
     
     if(len>2) 
    {
       pushMatrix();
       branch(len*ratio);
       popMatrix();
       
       pushMatrix();
       rotate(radians(-60)); 
       branch(getStartLength(len,ratio));
       popMatrix();
       
       pushMatrix();
       rotate(radians(60));
       branch(getStartLength(len,ratio));
       popMatrix();
     }
 }
 
 float getStartLength(float length,float  ratio)
 {
    float len=(1-ratio)*length;
    return len;
 }
}

class snowflake 
{
   PVector position ,velocity;
   float rotation ,aVelocity,radius,ratio;
   Branch[] branches=new Branch[6];
   
    snowflake(PVector pos,PVector vel,float rot,float aVel,float r,float rat)
    {
     position =pos;
     velocity=vel;
     rotation=rot;
     aVelocity=aVel;
     radius=r;
     ratio=rat;
     
     for(int i=0;i<6;i++){ branches[i]=new Branch(radius,ratio,i*60);}
    }
   
    void update()
    {
    position.add(velocity);
    rotation+=aVelocity;  
    }
    void show()  
    {
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians(rotation));
    for(Branch b:branches)
    {b.generate();}
    popMatrix();  
    }
}

class snowsystem   
{
  float speed ;
  ArrayList<snowflake> snowflakes;
  
  snowsystem (float speed_){
  speed=speed_;
  snowflakes=new ArrayList<snowflake>();
 }

void  generate() 
{
 PVector position =new PVector(random(0,width),0);
 PVector velocity =new PVector(0,random(5,10));
 float rotation =random(0,360);
 float aVel=random(-2,5);
 float radius =random(10,20);
 float ratio=0.5;
 snowflake s=new snowflake(position,velocity,rotation,aVel,radius,ratio);
 snowflakes.add(s);
}

void  emit()  
{
   if(speed >=1)
   {
   for(int i=0;i<speed;i++){ generate();}
   }
   else if(speed>0){if(random(1)<speed){generate();}}
}

void update()  
{
Iterator<snowflake> ite=snowflakes.iterator(); 
while(ite.hasNext()){snowflake s=ite.next();s.update();s.show(); 
if(s.position.y>(height+s.radius)){ite.remove();}                     
} 
}
void run () 
{ emit();update();}
}
