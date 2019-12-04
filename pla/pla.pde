// Author Shaheen Biradar 
// Reference : Youtube(Coding Train)

class Planet
{
  float r, angle,distance ,orbitspeed;
  Planet [] P  ;
  Planet [] Q ;
  PVector v;
  PShape g ; 
  PImage texture ;
Planet(float radius,float d,float o, PImage texture ){
   
    v = PVector.random3D();
    v.mult(d);
    angle = random(TWO_PI); 
    r = radius ;
    distance = d ;
    orbitspeed = o ;
    noStroke();
    g = createShape(SPHERE,r*2);
 
}
void moon1(int total,int level){
  
  Q = new Planet[total];
  for(int i = 0 ; i < Q.length;i++){
    float size = r/(level*2);
    float d = (r + size)*5 ; 
    float o = 0.02 ; 
    Q[i] = new Planet(size,d,o,texture);
    if (level < 2){
      int num = 2 ;
      Q[i].moon1(num,level+1);
    
    
    }
    
    
  
  
  }


}
void moon(int total,int level){
  
  P = new Planet[total];
  for(int i = 0 ; i < P.length;i++){
    float size = r/(level*2);
    float d = (r + size)*5 ; 
    float o = 0.02 ; 
    P[i] = new Planet(size,d,o,texture);
   
    if (level < 2){
      int num = 2 ; 
      P[i].moon(num,level+1);
    }
     }
}
 

void orbit(){
  
  angle = angle + orbitspeed ;
  if(P!=null){
  for(int i= 0 ; i < P.length ; i++){
   P[i].orbit();
  
  }
  
  }

}
void orbit1(){
  
  angle = angle + orbitspeed ;
  if(  Q!=null){
  for(int i= 0 ; i < Q.length ; i++){
   Q[i].orbit();
  
  }
  
  }

}
void ring(){
 noFill();
 PShape k = createShape(ELLIPSE,0,0,240,240);
 shape(k);


}
void show(){
 pushMatrix();
 smooth();
 PVector v2 = new PVector(0,2,2); 
 PVector p = v.cross(v2);
 rotate(angle,p.x,p.y*5,p.z*5);
 translate(v.x,v.y,v.z);
 shape(g);
 fill(200); 
 if (P!=null){
 for(int i = 0 ; i< P.length;i++){
   if(i==1){
   P[i].ring(); }
   P[i].show();
 
 }
 }
 popMatrix();

}

void show1(){
  lights();
 pushMatrix();
 smooth();
 PVector v3 = new PVector(0,2,2);
 PVector p1 = v.cross(v3);
 rotate(angle,p1.x,p1.y*5,p1.z*5);
 translate(v.x,v.y,v.z);
 shape(g);
 fill(255);
 if (Q!=null){
 for(int i = 0 ; i< Q.length;i++){
   
   Q[i].show1();
  
 }
 }
 popMatrix();

}



}
