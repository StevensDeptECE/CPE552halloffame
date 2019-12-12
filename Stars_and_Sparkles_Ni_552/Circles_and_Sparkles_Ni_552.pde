void setup(){
    size(600,600);
}
float x=25, y=25, x2=545, y2=545;
float dx=4.0,dy=4.0, Dx=-dx, Dy=-dy;
float d=80;
void draw(){
    background(138,153,245);
    //Assume the density of the two balls are the same.
    ellipse(x,y,d,d);
    fill(255,0,0);
    ellipse(x2,y2,d,d);
    fill(0,130,0);
    ellipse(x,y2,d,d);
    fill(0,0,255);
    ellipse(x2,y,d,d);
    fill(255,255,0);
    x=x+dx;
    y=y+dy;
    x2=x2+Dx;
    y2=y2+Dy;
    if ((x>=width-25) || (x<=25)){
        dx=-dx;
        star(x,y);
        star(x,y2);
    }
    if ((y<=25) || (y>=height-25)){
        dy=-dy;
        star(x,y);
        star(x2,y);
    }
    if ((x2>=width-55) || (x2<=55)){
        Dx=-Dx;
        star(x2,y);
        star(x2,y2);
    }
    if ((y2<=55) || (y2>=height-55)){
        Dy=-Dy;
        star(x,y2);
        star(x2,y2);
    } 
    //Sparkles appears if all circles become one
    if (x==x2 && y==y2){
        star(x-40,y-40);
        star(x-40,y+40);
        star(x+40,y-40);
        star(x+40,y+40);
    }
}
//Sparkles from processing.org
void star(float x, float y){
    translate(x,y);
    strokeWeight(2);
    beginShape();
    vertex(0,-50);
    vertex(14,-20);
    vertex(47,-15);
    vertex(23,7);
    vertex(29,40);
    vertex(0,25);
    vertex(-29,40);
    vertex(-23,7);
    vertex(-47,-15);
    vertex(-14,-20);
    endShape(CLOSE);
}
