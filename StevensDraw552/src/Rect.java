


import java.awt.*;
public class Rect extends Shape {
    private int w1, h1;
    public Rect(int x, int y, int w, int h) {
        super(x,y);
        this.w1 = w; this.h1 = h;
    }
    @Override
    public void draw(Graphics g) {
        if (x2>x && y2>y)
        g.drawRect(x, y, x2-x, y2-y);
        else
        g.drawRect(x2, y2, x-x2, y-y2);  
    }
}
