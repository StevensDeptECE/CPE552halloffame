void keyPressed() {
  if (key=='a' || key=='A') { //重置调试点
    PVector[] pve = new PVector[7]; 
    pve[0] = new PVector(width*0.1, height*0.2);
    pve[1] = new PVector(width*0.15, height*0.15);
    pve[2] = new PVector(width*0.2, height*0.2);
    pve[3] = new PVector(width*0.15, height*0.25);
    pve[4] = new PVector(width*0.1, height*0.4);
    pve[5] = new PVector(width*0.15, height*0.45);
    pve[6] = new PVector(width*0.2, height*0.4);

    boxes[boxLen]=new Box(pve, boxLen);
    boxLen++;
  } else if (key>50 & key<58) {
    int vnum = (key-48)*2;
    println(vnum);
    PVector[] pv = new PVector[vnum];
    for (int j=0; j<pv.length; j++) {
      pv[j] = new PVector(width*j*0.03+width*0.05 , height*(j%2)*0.1+height*0.1);
    }
    flow[flowLen] = new Flow(pv, int(random(1200,2200)*vnum));
    flowLen++;
  }else if(key == ' '){  //按空格切换运行/调试状态
    debug = !debug;
  }
  if(key=='s' || key =='S'){  //保存调试信息
  for (int i=0; i<boxLen; i++) {   
    JSONObject vertex = new JSONObject();
    vertex.setInt("Box ID", i);
    for (int j=0; j<7; j++) {
      String xx = "vertex " + j + " x";
      String yy = "vertex " + j + " y";
      vertex.setInt(xx, int(boxes[i].vertexx[j].x));
      vertex.setInt(yy, int(boxes[i].vertexx[j].y));
    }
    json.setJSONObject(i, vertex);
  }
  saveJSONArray(json, "data/boxVertex.json");

  for (int i=0; i<flowLen; i++) {   
    JSONObject vertex = new JSONObject();
    vertex.setInt("Flow ID", i);
    for (int j=0; j<flow[i].pos.length; j++) {
      String xx = "vertex " + j + " x";
      String yy = "vertex " + j + " y";
      vertex.setInt(xx, int(flow[i].pos[j].x));
      vertex.setInt(yy, int(flow[i].pos[j].y));
    }
    jsonf.setJSONObject(i, vertex);
  }
  saveJSONArray(jsonf, "data/flowVertex.json");
  }
}

void mousePressed() {
  if (mouseButton == LEFT & dragAvertex<0) {  //鼠标左键拖拽盒子点
    for (int i=0; i<boxLen; i++) {
      Box b = boxes[i];
      for (int j=0; j<7; j++) {
        if ( dist(b.vertexx[j].x, b.vertexx[j].y, mouseX, mouseY)<15) {
          dragAvertex = i*100+j;
          b.beDragged[j] = true;
          break;
        }
      }
      if (dragAvertex>0)break;
    }
  }

  if (mouseButton == RIGHT & dragAvertex<0) {   //鼠标右键拖拽线条点
    for (int i=0; i<flowLen; i++) {
      Flow f = flow[i];
      for (int j=0; j<f.pos.length; j++) {
        if ( dist(f.pos[j].x, f.pos[j].y, mouseX, mouseY)<15) {
          dragAvertex = i*500+j;
          f.beDragged[j] = true;
          break;
        }
      }
      if (dragAvertex>0)break;
    }
  }
}

void mouseReleased() { 
  println(dragAvertex);
  dragAvertex = -1;
  for (int i=0; i<boxLen; i++) {
    Box b = boxes[i];
    for (int j=0; j<7; j++) {
      b.beDragged[j] = false;
    }
  }

  for (int i=0; i<flowLen; i++) {
    Flow f = flow[i];
    for (int j=0; j<f.pos.length; j++) {
      f.beDragged[j] = false;
    }
  }
}