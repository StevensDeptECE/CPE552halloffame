


import java.awt.*;
public class Rect extends Shape {
    private int w1, h1;
    public Rect(int x, int y, int w, int h) {
        super(x,y);
        this.w1 = w; this.h1 = h;
    }
    @Override
    public void draw(Graphics g) {
        g.drawRect(x, y, w1-x, h1-y);
    }
}