class Box {  //盒子类
  PVector[] vertexx = new PVector[7];  //每个盒子7个顶点，三个面
  boolean[] beDragged;
  int id;
  int[] Bnum;
  color cc;
  float[] alp;

  Box(PVector[] _vertexx, int _id) {
    vertexx = _vertexx;
    beDragged = new boolean[7];
    for (int i=0; i<beDragged.length; i++) {
      beDragged[i] = false;
    }
    id = _id;
    Bnum = new int[3];
    alp = new float[3];
    if (id==14) {  //频段
      Bnum[0] = int(random(12, 16)); 
      Bnum[1] = int(random(16, 20));  
      Bnum[2] = int(random(20, 24));  
      cc = color(random(255), random(80, 120), 255);
    } else if (id==0 || id==6 || id==11 || id==13) { //YIN FU
      Bnum[0] = int(random(12, 18)); 
      Bnum[1] = int(random(18, 26));  
      Bnum[2] = int(random(26, 32));  
      cc = color(random(255), random(80, 120), 255);
    } else if (id==4 || id==5 || id==8 || id==9 || id == 10 || id ==15) {
      Bnum[0] = int(random(4, 7));
      Bnum[1] = int(random(7, 10));
      Bnum[2] = int(random(10, 12));
      cc = color(random(80, 190), random(80, 120), 255);
    } else if (id==1 || id==2 || id==3 || id==7 || id==12) {
      Bnum[0] = int(random(80, 88));
      Bnum[1] = int(random(88, 96));
      Bnum[2] = int(random(96, 104));
      cc = color(random(130, 170), random(80, 120), 255);
    }

    alp[0] = 0;
    alp[1] = 0;
    alp[2] = 0;
  }

  void show() {  //画方格
    if (debug) {
      stroke(255, 150);
      fill(160, 200, 200, 150);
    } else {
      noStroke();
      fill(0);
    }
    beginShape();
    vertex(vertexx[0].x, vertexx[0].y);
    vertex(vertexx[1].x, vertexx[1].y);
    vertex(vertexx[2].x, vertexx[2].y);
    vertex(vertexx[3].x, vertexx[3].y);
    endShape(CLOSE);
    beginShape();
    vertex(vertexx[0].x, vertexx[0].y);
    vertex(vertexx[4].x, vertexx[4].y);
    vertex(vertexx[5].x, vertexx[5].y);
    vertex(vertexx[3].x, vertexx[3].y);
    endShape(CLOSE);
    beginShape();
    vertex(vertexx[3].x, vertexx[3].y);
    vertex(vertexx[5].x, vertexx[5].y);
    vertex(vertexx[6].x, vertexx[6].y);
    vertex(vertexx[2].x, vertexx[2].y);
    endShape(CLOSE);


    if (!debug) {   //调试状态
      response();

      fill(cc, alp[0]);
      beginShape();
      vertex(vertexx[0].x, vertexx[0].y);
      vertex(vertexx[1].x, vertexx[1].y);
      vertex(vertexx[2].x, vertexx[2].y);
      vertex(vertexx[3].x, vertexx[3].y);
      endShape(CLOSE);

      fill(cc, alp[1]);
      beginShape();
      vertex(vertexx[0].x, vertexx[0].y);
      vertex(vertexx[4].x, vertexx[4].y);
      vertex(vertexx[5].x, vertexx[5].y);
      vertex(vertexx[3].x, vertexx[3].y);
      endShape(CLOSE);

      fill(cc, alp[2]);
      beginShape();
      vertex(vertexx[3].x, vertexx[3].y);
      vertex(vertexx[5].x, vertexx[5].y);
      vertex(vertexx[6].x, vertexx[6].y);
      vertex(vertexx[2].x, vertexx[2].y);
      endShape(CLOSE);
    }

    if (debug) {
      fill(255);
      textSize(32);
      text(id, vertexx[3].x-40, vertexx[3].y+40);
      
      //strokeWeight(3);
      noFill();
      stroke(255);
      //fill(0);
      for (int i=0; i<7; i++) {
        ellipse(vertexx[i].x, vertexx[i].y, 4, 4);
      }
    }
  }   

  void drag() {   //鼠标拖拽顶点位置
    for (int i=0; i<7; i++) {
      if (beDragged[i] & dist(vertexx[i].x, vertexx[i].y, mouseX, mouseY)<50) {
        vertexx[i].x = mouseX;
        vertexx[i].y = mouseY;
      }
    }
  }

  void response() {  //音乐可视化部分
    if (musicState==0 || musicState==5) {
      for (int i=0; i<3; i++) {
        if (fft.getBand(Bnum[i])>band[Bnum[i]]*2) {
          //alp[i]=255;
          if (id==0 || id==6 || id==11 || id==13 || id ==14) {  //音符
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*2;
          } else if (id==1 || id==2 || id==3 || id==7 || id==12) {   //嚓音
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*5;
          } else {   //低音
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*0.5;
          }
        } else {
          alp[i]-=30;
        }
        alp[i]=constrain(alp[i], 0, 255);
      }
    } else if (musicState==1 || musicState==3) {
      for (int i=0; i<3; i++) {
        if (fft.getBand(Bnum[i])>band[Bnum[i]]) {
          //alp[i]=255;
          if (id==0 || id==6 || id==11 || id==13 || id==14) {  //音符
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*2;
          } else if (id==1 || id==2 || id==3 || id==7 || id==12) {   //嚓音
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*5;
          } else {   //低音
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*0.5;
          }
        } else {
          alp[i]-=30;
        }
        alp[i]=constrain(alp[i], 0, 255);
      }
      
      if (alp[0]<5 & alp[1]<5 & alp[2]<5) {
        cc = bassColor;
      }
    } else {

      for (int i=0; i<3; i++) {
        if (fft.getBand(Bnum[i])>band[Bnum[i]]) {
          if (id==0 || id==6 || id==11 || id==13 || id==14) {  //音符
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*2;
          } else if (id==1 || id==2 || id==3 || id==7 || id==12) {   //嚓音
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*5;
          } else {   //低音
            alp[i]+=(fft.getBand(Bnum[i])-band[Bnum[i]])*0.5;
          }
        } else {
          alp[i]-=30;
        }
        alp[i]=constrain(alp[i], 0, 255);
      }

      if (alp[0]<5 & alp[1]<5 & alp[2]<5 & random(1)<0.1) {
        cc = color(random(255), random(80, 120), 255);
      }
    }
  }
}
