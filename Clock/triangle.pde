final class TriangleClockFace extends AbstractClockFace {
  TriangleClockFace(float rad, PFont fnt) {
    super(rad, fnt);
  }

  void display() {
    pushStyle();
    
    // Background
    float areaRadius = radius * 0.85f;
    ellipseMode(RADIUS);
    fill(white);
    stroke(lightGray);
    strokeWeight(1f);
    ellipse(0f, 0f, areaRadius, areaRadius);
    
    stroke(lightGray, 30f);
    for (int k = 0; k < 12; k++) {
      float angle1 = k * TWO_PI / 12 - HALF_PI;
      for(int m = 0; m < 4; m++) {
        float angle2 = m * TWO_PI / 4 - HALF_PI;
        line(areaRadius * cos(angle1), areaRadius * sin(angle1), areaRadius * cos(angle2), areaRadius * sin(angle2));
      }
    }

    // Ticks
    drawHourTickMarks(0.1f, 1f, lightGray, 0.1f);
    drawHourNumbers(0.1f, darkGray, 0f);

    popStyle();
  }
}


abstract class TriangleClockHand extends AbstractClockHand {
  float handSize;
  boolean isFilled;

  TriangleClockHand(float len, float wgt, color col, float sz, boolean fl) {
    super(len, wgt, col);
    handSize = sz;
    isFilled = fl;
  }

  abstract float getAngle();

  void display() {
    pushStyle();
    stroke(handColor);
    strokeWeight(handWeight);
    if (isFilled) {
      fill(handColor);
    }
    else {
      noFill();
    }
    ellipseMode(CENTER);
    ellipse(handLength * cos(getAngle()), handLength * sin(getAngle()), handSize, handSize);
    popStyle();
  }
}

final class TriangleHourHand extends TriangleClockHand {
  TriangleHourHand(float len, float wid, color col, float sz, boolean fl) {
    super(len, wid, col, sz, fl);
  }

  float getAngle() {
    return hourToRadians12(hourFloat_China()) - HALF_PI;
  }
}

final class TriangleMinuteHand extends TriangleClockHand {
  TriangleMinuteHand(float len, float wid, color col, float sz, boolean fl) {
    super(len, wid, col, sz, fl);
  }

  float getAngle() {
    return minuteToRadians(minuteFloat()) - HALF_PI;
  }
}

final class TriangleSecondHand extends TriangleClockHand {
  TriangleSecondHand(float len, float wid, color col, float sz, boolean fl) {
    super(len, wid, col, sz, fl);
  }

  float getAngle() {
    return secondToRadians(float(second())) - HALF_PI;
  }
}


final class TriangleClockComponent extends AbstractClockComponent {
  float radius;
  
  TriangleClockComponent(float rad) {
    super();
    radius = rad;
  }
  
  void display() {
    pushStyle();
    stroke(darkGray);
    strokeWeight(2f);
    noFill();
    float hourAngle = hourToRadians12(hourFloat()) - HALF_PI;
    float minuteAngle = minuteToRadians(minuteFloat()) - HALF_PI;
    float secondAngle = secondToRadians(float(second())) - HALF_PI;
    triangle(radius * cos(hourAngle), radius * sin(hourAngle), radius * cos(minuteAngle), radius * sin(minuteAngle), radius * cos(secondAngle), radius * sin(secondAngle));
    popStyle();
  }
}
