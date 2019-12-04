PVector []pos;
PVector [][]newPos;
float []time;
boolean drawd;
float drawTime;
int brushID,num;
float interval,cInterval;
int Y=220;
int Cb;
int Cr;
color cl;
float r;

void setup(){
    size(1000,1000);
    background(255);
    num = 10;
    pos = new PVector[0];
    newPos = new PVector[num][0];
    time = new float[0];
    drawd = false;
    brushID = 0;
    interval = 5;
    cInterval = 100;
}

void draw(){
    if(drawd){
        
        r=random(PI);
        if(millis() - drawTime > time[brushID+1] - time[0]){
          //Cb=int(100*(sin((2*PI/(float)(millis() - drawTime))*(time[brushID+1] - time[0])+r)))+128;
          //Cr=int(100*(cos((2*PI/(float)(millis() - drawTime))*(time[brushID+1] - time[0])+r)))+128;
            for(int i = 0;i < num-1;i++){
                for(int j = 0;j < brushID;j++){
                    Cb=int(100*(sin((2*PI/(float)brushID)*j+r)))+128;
                    Cr=int((100*(cos((2*PI/(float)brushID)*j+r)))+128)/2;
                    cl=color(int(1.164*(Y-16)+1.596*(Cr-128)),int(1.164*(Y-16)-0.392*(Cb-128)-0.813*(Cr-128)),int(1.164*(Y-16)+2.017*(Cb-128)));
                    float r = dist(newPos[i][j].x,newPos[i][j].y,newPos[i][brushID].x,newPos[i][brushID].y);
                    if(r < cInterval){
                        stroke(cl,map(r,0,cInterval,8,2));
                        line(newPos[i][j].x,newPos[i][j].y,newPos[i][brushID].x,newPos[i][brushID].y);
                    }
                }
            }
            brushID++;
            if(newPos[0][brushID+1].x == 0 && newPos[0][brushID+1].y == 0){
            brushID+=2;
            }
        }
        if(brushID+1 >= newPos[0].length-1){ 
        drawd = false;
        }
    }
}

void mouseDragged(){
    if(pos.length == 0 || dist(mouseX,mouseY,pos[pos.length-1].x,pos[pos.length-1].y) > interval){
        pos = (PVector [])append(pos,new PVector(mouseX,mouseY));
    }
    println(pos.length);
    for(int i = 0;i < pos.length;i++){
        float r = dist(pos[i].x,pos[i].y,pos[pos.length-1].x,pos[pos.length-1].y);
        if(r < cInterval){
            stroke(0,map(r,0,cInterval,8,2));
            line(pos[i].x,pos[i].y,pos[pos.length-1].x,pos[pos.length-1].y);
        }
    }

    for(int i = 0;i < num;i++){
        newPos[i] = (PVector [])append(newPos[i],Trans(pos[pos.length-1],2*PI/(num-1)*(i+1)));
    }
        time = append(time,millis());
}

void mouseReleased(){
    pos = (PVector [])append(pos,new PVector(0,0));
    for(int i = 0;i < num;i++){
    newPos[i] = (PVector [])append(newPos[i],new PVector(0,0));
    }
    time = append(time,millis());
}

void keyPressed(){
    if(keyCode == 'A' && pos.length!=0){
        background(255);
        drawTime = millis();
        drawd = true;
        pos = new PVector[0];
    }
    if(keyCode == 'C'){
        background(255);
        pos = new PVector[0];
        newPos = new PVector[num][0];
        time = new float[0];
        brushID = 0;
        drawd = false;
    }
}

PVector Trans(PVector a,float angle){
    PVector center = new PVector(width/2,height/2);
    float l = PVector.dist(a,center);
    float angle1 = atan2(a.y - center.y,a.x - center.x);
    float angle2 = angle1 + angle;
    float x = center.x + l*cos(angle2);
    float y = center.y + l*sin(angle2);
    PVector newPos = new PVector(x,y);
    return newPos;
}