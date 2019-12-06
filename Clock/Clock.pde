/*
   Author: XINRU ZHANG
   cite: https://www.openprocessing.org/sketch/446186
*/

// Processing 3.3.6

/* @pjs font="Lato-Regular.ttf"; */
/*
  The font "Lato" is designed by Łukasz Dziedzic (http://www.latofonts.com/).
  This font is licensed under the SIL Open Font License 1.1 (http://scripts.sil.org/OFL).
*/

PFont currentFont;
color white, lightGray, darkGray, black;
ArrayList<AnalogClock> clockList;

void setup() {
  size(640, 640);
  smooth(8);

  // Prepare font
  String fontFilePath = "Lato-Regular.ttf";
  float fontLoadSize = 24f;
  currentFont = createFont(fontFilePath, fontLoadSize, true);

  // Prepare colors
  colorMode(HSB, 360f, 100f, 100f, 100f);
  white = color(0f, 0f, 100f);
  lightGray = color(0f, 0f, 75f);
  darkGray = color(0f, 0f, 30f);
  black = color(0f, 0f, 12.5f);
  
  // Prepare clocks
  clockList = new ArrayList<AnalogClock>();
  AnalogClockBuilder builder = new AnalogClockBuilder();
  float clockFaceRadius = 100f;

  // Basic clock
  AnalogClock basicClock = builder
    .position(width * 0.25f, height * 0.25f)
    .face(new BasicClockFace(clockFaceRadius, currentFont))
    .addHand(new BasicHourHand(clockFaceRadius * 0.5f, 7f, 0f, black, PROJECT))
    .addHand(new BasicMinuteHand(clockFaceRadius * 0.85f, 3f, 0f, black, PROJECT))
    .addHand(new BasicSecondHand(clockFaceRadius * 0.85f, 1f, 0f, black, PROJECT))
    .caption("New York")
    .font(currentFont)
    .build();
  clockList.add(basicClock);
  builder.clear();

  // Minimal clock
  AnalogClock minimalClock = builder
    .position(width * 0.75f, height * 0.25f)
    .face(new MinimalClockFace(clockFaceRadius, currentFont))
    .addHand(new MinimalHourHand(clockFaceRadius * 0.5f, 2f, 0f, black, ROUND))
    .addHand(new MinimalMinuteHand(clockFaceRadius * 0.9f, 2f, 0f, black, ROUND))
    .addHand(new MinimalSecondHand(clockFaceRadius * 0.9f, 1f, 0.2f, black, ROUND))
    .caption("California")
    .font(currentFont)
    .build();
  clockList.add(minimalClock);
  builder.clear();
  
  // Reversed clock
  AnalogClock reversedClock = builder
    .position(width * 0.25f, height * 0.75f)
    .face(new ReversedClockFace(clockFaceRadius, currentFont))
    .addHand(new ReversedHourHand(clockFaceRadius * 0.9f, 6f, -0.65f, black, ROUND))
    .addHand(new ReversedMinuteHand(clockFaceRadius * 0.9f, 3f, -0.65f, black, ROUND))
    .addHand(new ReversedSecondHand(clockFaceRadius * 0.9f, 1f, -0.65f, black, ROUND))
    .caption("England")
    .font(currentFont)
    .build();
  clockList.add(reversedClock);
  builder.clear();

  // Triangle clock
  AnalogClock triangleClock = builder
    .position(width * 0.75f, height * 0.75f)
    .face(new TriangleClockFace(clockFaceRadius, currentFont))
    .addHand(new TriangleHourHand(clockFaceRadius * 0.85f, 1f, black, 14f, true))
    .addHand(new TriangleMinuteHand(clockFaceRadius * 0.85f, 1f, black, 10f, true))
    .addHand(new TriangleSecondHand(clockFaceRadius * 0.85f, 1f, black, 12f, false))
    .addComponent(new TriangleClockComponent(clockFaceRadius * 0.85f))
    .caption("China")
    .font(currentFont)
    .build();
  clockList.add(triangleClock);
  builder.clear();
}

void draw() {
  background(white);
  for(AnalogClock currentClock : clockList) {
    currentClock.display();
  }
}



// Utility

float hourFloat() {
  return float(hour()) + norm(minuteFloat(), 0f, 60f);
}
float minuteFloat() {
  return float(minute()) + norm(float(second()), 0f, 60f);
}
float hourFloat_Cali() {
  return float(hour()-3) + norm(minuteFloat(), 0f, 60f);
}
float hourFloat_China() {
  return float(hour()+13) + norm(minuteFloat(), 0f, 60f);
}
float hourFloat_England() {
  return float(hour()+5) + norm(minuteFloat(), 0f, 60f);
}

float hourToRadians24(float h) {
  return map(h, 0f, 24f, 0f, TWO_PI);
}
float hourToRadians12(float h) {
  return map(h, 0f, 24f, 0f, TWO_PI * 2);
}
float minuteToRadians(float m) {
  return map(m, 0f, 60f, 0f, TWO_PI);
}
float secondToRadians(float s) {
  return map(s, 0f, 60f, 0f, TWO_PI);
}
