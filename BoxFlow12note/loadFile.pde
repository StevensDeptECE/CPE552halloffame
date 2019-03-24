void ini() {
 
  json = loadJSONArray("boxVertex.json");
  boxLen = json.size();
  
  PVector[][] pve = new PVector[boxLen][7]; 
  boxes = new Box[100];  
  for (int i=0; i<boxLen; i++) {  
    JSONObject data = json.getJSONObject(i); 
    for (int j=0; j<7; j++) {
      String xx = "vertex " + j + " x";
      String yy = "vertex " + j + " y";
      pve[i][j] = new PVector(data.getInt(xx), data.getInt(yy));
    }
    boxes[i] = new Box(pve[i],i);
  }

  jsonf = loadJSONArray("flowVertex.json");
  flowLen = 0;//jsonf.size();
  
  flow = new Flow[100];
  for (int i=0; i<flowLen; i++) {  
    JSONObject data = jsonf.getJSONObject(i);
    int vnum = (data.size()-1)/2;
    PVector[] pv = new PVector[vnum];
    for (int j=0; j<pv.length; j++) {
      String xx = "vertex " + j + " x";
      String yy = "vertex " + j + " y";
      pv[j] = new PVector(data.getInt(xx), data.getInt(yy));
    }
    flow[i] = new Flow(pv, int(random(800,1200)*vnum));
  }

  minim = new Minim(this);
  bgm = minim.loadFile("1.mp3", 1024);
  bgm.loop();
  fft = new FFT( bgm.bufferSize(), bgm.sampleRate() );

  band = new float[512];
  for(int i=0; i<512; i++){
    if(i<4){      //重低音
      band[i] = 100;
    }else if(i<19){  //音符音
      band[i] = 30;
    }else if(i<26){  //中频
      band[i] = 20;
    }else{           //嚓音
      band[i] = 10;
    }
  }
  
  bg = loadImage("pic.jpg");
}
