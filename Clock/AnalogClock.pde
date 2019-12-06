final class AnalogClock {
  AbstractClockFace face;
  ArrayList<AbstractClockHand> hands;
  ArrayList<AbstractClockComponent> components;
  float positionX;
  float positionY;
  String captionText;
  PFont font;

  AnalogClock(float posX, float posY, AbstractClockFace f, ArrayList<AbstractClockHand> h, ArrayList<AbstractClockComponent> com, String cap, PFont fnt) {
    positionX = posX;
    positionY = posY;
    face = f;
    hands = h;
    components = com;
    captionText = cap;
    font = fnt;
  }

  void display() {
    pushMatrix();
    translate(positionX, positionY);

    face.display();
    for (AbstractClockHand currentHand : hands) {
      currentHand.display();
    }
    for (AbstractClockComponent currentComponent : components) {
      currentComponent.display();
    }
    
    pushStyle();
    textAlign(CENTER);
    textFont(font, 16f);
    fill(darkGray);
    text(captionText, 0f, face.getRadius() + 30f);
    popStyle();
    
    popMatrix();
  }
}

final class AnalogClockBuilder {
  float xPosition;
  float yPosition;
  AbstractClockFace clockFace;
  ArrayList<AbstractClockHand> hands;
  ArrayList<AbstractClockComponent> components;
  String captionText;
  PFont fontData;

  AnalogClockBuilder() {
    hands = new ArrayList<AbstractClockHand>();
    components = new ArrayList<AbstractClockComponent>();
    captionText = "";
  }
  
  AnalogClockBuilder position(float x, float y) {
    xPosition = x;
    yPosition = y;
    return this;
  }

  AnalogClockBuilder face(AbstractClockFace f) {
    clockFace = f;
    return this;
  }
  
  AnalogClockBuilder addHand(AbstractClockHand h) {
    hands.add(h);
    return this;
  }
  
  AnalogClockBuilder addComponent(AbstractClockComponent c) {
    components.add(c);
    return this;
  }
  
  AnalogClockBuilder caption(String cap) {
    captionText = cap;
    return this;
  }
  
  AnalogClockBuilder font(PFont fnt) {
    fontData = fnt;
    return this;
  }

  AnalogClock build() {
    return new AnalogClock(xPosition, yPosition, clockFace, hands, components, captionText, fontData);
  }
  
  void clear() {
    clockFace = null;
    hands = new ArrayList<AbstractClockHand>();
    components = new ArrayList<AbstractClockComponent>();
    xPosition = 0f;
    yPosition = 0f;
    captionText = "";
  }
}
