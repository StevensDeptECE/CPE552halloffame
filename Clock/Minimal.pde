final class MinimalClockFace extends AbstractClockFace {
  MinimalClockFace(float rad, PFont fnt) {
    super(rad, fnt);
  }
  
  void display() {
    pushStyle();
    ellipseMode(CENTER);
    fill(black);
    noStroke();
    ellipse(0f, 0f, 7f, 7f);
    drawHourTickMarks(3f, black, 0.01f);
    drawMinuteTickMarks(2f, lightGray, 0.01f);
    popStyle();

  }
}


abstract class MinimalClockHand extends AbstractClockHand {
  float offsetFactor;
  int strokeCapParameter;

  MinimalClockHand(float len, float wgt, float off, color col, int strCap) {
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

final class MinimalHourHand extends MinimalClockHand {
  MinimalHourHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return hourToRadians12(hourFloat_Cali()) - HALF_PI;
  }
}

final class MinimalMinuteHand extends MinimalClockHand {
  MinimalMinuteHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return minuteToRadians(minuteFloat()) - HALF_PI;
  }
}

final class MinimalSecondHand extends MinimalClockHand {
  MinimalSecondHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return secondToRadians(float(second())) - HALF_PI;
  }
}
