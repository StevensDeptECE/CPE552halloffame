class Flow {
  PVector[] pos;
  boolean[] beDragged;
  long Gst;
  float len;
  color clr;
  int type;
  float speed;
  int speedBand;
  float alp, astp;

  float now, stt;

  Flow(PVector[]_pos, long _Gst) { 
    pos = _pos;
    beDragged = new boolean[pos.length];
    for (int i=0; i<beDragged.length; i++) {
      beDragged[i] = false;
    }
    Gst = _Gst;
    len = 0;
    for (int i=0; i<pos.length-1; i++) {
      len += PVector.dist(pos[i], pos[i+1]);
    }

    clr = color(random(10,255), random(10, 60), 255);
    type = int(random(2));
    speed = 2.0;
    speedBand = int(random(512));
    now = 0;
    stt = 0;
    alp = random(100, 200);
    astp = random(2, 6);
  }

  void move() { //线条流动
    speed = map(fft.getBand(speedBand), 0, band[speedBand], 10, 100);
    speed = constrain(speed, 10, 100);
    now += len*speed/Gst;
    now = constrain(now, 0, len);
    if (now==len) {
      stt += len*speed/Gst;
      stt = constrain(stt, 0, len);
    }

    //loop type
    if (stt == len) {
      now = 0;
      stt = 0;
    }

    alp+=astp;
    if (alp>255 || alp<100)astp*=-1;

    float acm = 0;
    for (int i=0; i<pos.length-1; i++) {
      float d =  PVector.dist(pos[i], pos[i+1]);
      acm += d;
      if (acm > now) {
        PVector v = PVector.sub(pos[i+1], pos[i]);
        v.mult((now - (acm - d))/d);
        v.add(new PVector(pos[i].x, pos[i].y));
        stroke(hue(clr),saturation(clr)*2,brightness(clr),alp*0.5);
        strokeWeight(8);
        line(pos[i].x, pos[i].y, v.x, v.y);
        stroke(clr, alp);
        strokeWeight(3);
        line(pos[i].x, pos[i].y, v.x, v.y);
        break;
      } else {
        if (now==len) {
          if (type==0) {  //线条流动模式1
            if (acm - d >= stt) {
              stroke(hue(clr),saturation(clr)*2,brightness(clr),alp*0.5);
              strokeWeight(8);
              line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
              stroke(clr, alp);
              strokeWeight(3);
              line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
            } else {
              PVector v = PVector.sub(pos[i], pos[i+1]);
              v.mult(max(0, 1-((stt-acm+d)/d)));
              v.add(new PVector(pos[i+1].x, pos[i+1].y));
              stroke(hue(clr),saturation(clr)*2,brightness(clr),alp*0.5);
              strokeWeight(8);
              line(pos[i+1].x, pos[i+1].y, v.x, v.y);
              stroke(clr, alp);
              strokeWeight(3);
              line(pos[i+1].x, pos[i+1].y, v.x, v.y);
            }
          } else {  //线条流动模式2
            if (len-stt>=acm) {
              stroke(hue(clr),saturation(clr)*2,brightness(clr),alp*0.5);
              strokeWeight(8);
              line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
              stroke(clr, alp);
              strokeWeight(3);
              line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
            } else {
              PVector v = PVector.sub(pos[i+1], pos[i]);
              v.mult(max(0, (len-stt-acm+d)/d));
              v.add(new PVector(pos[i].x, pos[i].y));
              stroke(hue(clr),saturation(clr)*2,brightness(clr),alp*0.5);
              strokeWeight(8);
              line(pos[i].x, pos[i].y, v.x, v.y);
              stroke(clr, alp);
              strokeWeight(3);
              line(pos[i].x, pos[i].y, v.x, v.y);
            }
          }
        } else {
          stroke(hue(clr),saturation(clr)*2,brightness(clr),alp*0.5);
          strokeWeight(8);
          line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
          stroke(clr, alp);
          strokeWeight(3);
          line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
        }
      }
    }
  }

  void drag() {  //
    for (int i=0; i<pos.length; i++) {
      if (beDragged[i] & dist(pos[i].x, pos[i].y, mouseX, mouseY)<50) {
        pos[i].x = mouseX;
        pos[i].y = mouseY;
        fill(255, 150);
        ellipse(pos[i].x, pos[i].y, 20, 20);
        len = 0;
        for (int j=0; j<pos.length-1; j++) {
          len += PVector.dist(pos[j], pos[j+1]);
        }
      }
    }
  }

  void display() {  //显示线条
    stroke(hue(clr),255,255);
    //strokeWeight(3);
    for (int i=0; i<pos.length-1; i++) {
      line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
    }

    noFill();
    
    for (int i=0; i<pos.length; i++) {
      if(i==0){
        stroke(255, 255, 255);
      }else{
        stroke(47, 255, 255);
      }
      ellipse(pos[i].x, pos[i].y, 3, 3);
    }
  }
}
