

class Stars{
  float x ; 
  float y ; 
  float z ; 
 
  
  public Stars(){
    
    x = random(0,width);
    y = random(0,height);
    z = width ; 
   
    
    
  
  
  }
  void display(){
 
    fill(255);
    ellipse(x,y,4,4);
   

   
  
  }

}
