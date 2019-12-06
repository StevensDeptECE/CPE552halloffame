final class ReversedClockFace extends AbstractClockFace {
  ReversedClockFace(float rad, PFont fnt) {
    super(rad, fnt);
  }

  void display() {
    pushStyle();    
    
    // Background
    ellipseMode(RADIUS);
    fill(white);
    stroke(black);
    strokeWeight(2f);
    ellipse(0f, 0f, radius, radius);


    // Ticks
    drawHourTickMarks(0.04f, 1f, darkGray, 0.47f);
    drawHourNumbers(0.1f, black, 0.6f);
    
    popStyle();
  }
}
abstract class ReversedClockHand extends AbstractClockHand {
  float offsetFactor;
  int strokeCapParameter;

  ReversedClockHand(float len, float wgt, float off, color col, int strCap) {
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

final class ReversedHourHand extends ReversedClockHand {
  ReversedHourHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return hourToRadians12(hourFloat_England()) - HALF_PI;
  }
}

final class ReversedMinuteHand extends ReversedClockHand {
  ReversedMinuteHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return minuteToRadians(minuteFloat()) - HALF_PI;
  }
}

final class ReversedSecondHand extends ReversedClockHand {
  ReversedSecondHand(float len, float wid, float off, color col, int strCap) {
    super(len, wid, off, col, strCap);
  }

  float getAngle() {
    return secondToRadians(float(second())) - HALF_PI;
  }
}
