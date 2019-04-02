

import java.awt.*;

public class Star extends Shape {
    private int x2, y2;
    public Star(int x, int y, int x2, int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
    }
    @Override
    public void draw(Graphics g) {
        // Code here...
        
        g.drawLine(x, y, x2, y2);
    }   
}