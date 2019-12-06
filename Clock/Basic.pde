final class BasicClockFace extends AbstractClockFace {
  BasicClockFace(float rad, PFont fnt) {
    super(rad, fnt);
  }
  
  void display() {
    pushStyle();
    
    // Background
    fill(white);
    stroke(black);
    strokeWeight(5f);
    ellipseMode(RADIUS);
    ellipse(0f, 0f, radius, radius);
  
    // Ticks
    fill(black);
    strokeCap(SQUARE);
    textAlign(CENTER, BASELINE);
    
    drawHourTickMarks(0.08f, 2f, black, 0.05f);
    drawMinuteTickMarks(0.05f, 1f, black, 0.05f);
    drawHourNumbers(0.25f, black, 0.28f);
    
    popStyle();
  }
}


abstract class BasicClockHand extends AbstractClockHand {
  float offsetFactor;
  int strokeCapParameter;

  BasicClockHand(float len, float wgt, float off, color col, int strCap) {
    super(len, wgt, col);
    offsetFactor = off;
    strokeCapParameter = strCap;
  }

  abstract float getAngle();

  void display() {
    pushStyle();
    stroke(handColor);
    strokeWeight(handWeight);
    strokeCap(strokeCapParameter);
    line(-cos(getAngle()) * handLength * offsetFactor, -sin(getAngle()) * handLength * offsetFactor, cos(getAngle()) * handLength, sin(getAngle()) * handLength);
    popStyle();
  }
}

final class BasicHourHand extends BasicClockHand {
  BasicHourHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return hourToRadians12(hourFloat()) - HALF_PI;
  }
}

final class BasicMinuteHand extends BasicClockHand {
  BasicMinuteHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return minuteToRadians(minuteFloat()) - HALF_PI;
  }
}

final class BasicSecondHand extends BasicClockHand {
  BasicSecondHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return secondToRadians(float(second())) - HALF_PI;
  }
}
