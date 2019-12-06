abstract class AbstractClockFace {
  float radius;
  PFont font;


  AbstractClockFace(float rad, PFont fnt) {
    radius = rad;
    font = fnt;
  }
  
  float getRadius() {
    return radius;
  }

  abstract void display();

  void drawTickMark(float tickAngle, float tickSizeFactor, float tickWeight, float paddingFactor) {
    float x = cos(tickAngle) * radius * (1f - paddingFactor);
    float y = sin(tickAngle) * radius * (1f - paddingFactor);

    pushMatrix();
    translate(x, y);
    rotate(tickAngle);
    line(- radius * tickSizeFactor, 0f, 0f, 0f);
    popMatrix();
  }

  void drawTickMarkDot(float tickAngle, float tickWeight, float paddingFactor) {
    float x = cos(tickAngle) * radius * (1f - paddingFactor);
    float y = sin(tickAngle) * radius * (1f - paddingFactor);

    pushMatrix();
    translate(x, y);
    ellipse(0f, 0f, tickWeight, tickWeight);
    popMatrix();
  }

  void drawHourNumber(float tickAngle, float numberSizeFactor, int hour, float paddingFactor) {
    float x = cos(tickAngle) * radius * (1f - paddingFactor);
    float y = sin(tickAngle) * radius * (1f - paddingFactor);

    pushMatrix();
    translate(x, y);
    float valignFactor = 1.20;  // Different for each font
    text(hour, 0f, (textAscent() - textDescent()) * valignFactor / 2f);
    popMatrix();
  }

  void drawHourTickMarks(float tickSizeFactor, float tickWeight, color tickColor, float paddingFactor) {
    pushStyle();
    strokeCap(SQUARE);
    stroke(tickColor);
    strokeWeight(tickWeight);

    int tickCount = 12;
    for (int i = 0; i < tickCount; i++) {
      float angle = i * TWO_PI / tickCount - HALF_PI;
      drawTickMark(angle, tickSizeFactor, tickWeight, paddingFactor);
    }
    
    popStyle();
  }

  void drawMinuteTickMarks(float tickSizeFactor, float tickWeight, color tickColor, float paddingFactor) {
    pushStyle();
    strokeCap(SQUARE);
    stroke(tickColor);
    strokeWeight(tickWeight);

    int tickCount = 60;
    for (int i = 0; i < tickCount; i++) {
      if (i % 5 == 0) {
        continue;
      }
      float angle = i * TWO_PI / tickCount - HALF_PI;
      drawTickMark(angle, tickSizeFactor, tickWeight, paddingFactor);
    }
    
    popStyle();
  }

  void drawHourTickMarks(float tickWeight, color tickColor, float paddingFactor) {
    pushStyle();
    ellipseMode(CENTER);
    noStroke();
    fill(tickColor);

    int tickCount = 12;
    for (int i = 0; i < tickCount; i++) {
      float angle = i * TWO_PI / tickCount - HALF_PI;
      drawTickMarkDot(angle, tickWeight, paddingFactor);
    }
    
    popStyle();
  }

  void drawMinuteTickMarks(float tickWeight, color tickColor, float paddingFactor) {
    pushStyle();
    ellipseMode(CENTER);
    noStroke();
    fill(tickColor);

    int tickCount = 60;
    for (int i = 0; i < tickCount; i++) {
      if (i % 5 == 0) {
        continue;
      }
      float angle = i * TWO_PI / tickCount - HALF_PI;
      drawTickMarkDot(angle, tickWeight, paddingFactor);
    }
    
    popStyle();
  }

  void drawHourNumbers(float numberSizeFactor, color numberColor, float paddingFactor) {
    pushStyle();
    textFont(font, radius * numberSizeFactor);
    textAlign(CENTER, BASELINE);
    fill (numberColor);

    int tickCount = 12;
    for (int i = 0; i < tickCount; i++) {
      float angle = i * TWO_PI / tickCount - HALF_PI;
      int currentHour = i;
      if (currentHour == 0) {
        currentHour = 12;
      }
      drawHourNumber(angle, numberSizeFactor, currentHour, paddingFactor);  
    }
    
    popStyle();
  }
}

abstract class AbstractClockHand {
  float handLength;
  float handWeight;
  color handColor;

  AbstractClockHand(float len, float wgt, color col) {
    handLength = len;
    handWeight = wgt;
    handColor = col;
  }

  abstract float getAngle();

  abstract void display();
}

abstract class AbstractClockComponent {
  AbstractClockComponent() {
  }
  
  abstract void display();
}
