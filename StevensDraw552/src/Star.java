import java.awt.*;
import static java.lang.Math.*;

public class Star extends Shape {
    private int x2, y2, numPoints = 5;
    private final int[] coords = new int[numPoints*2];
    private int dx = abs(x2-x), dy = abs(y2-y);
    public Star(int x, int y, int x2, int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
        
        if (dx == 0) dx = 1;
        if (dy == 0) dy = 1;
        int r = distance(x,y,x2,y2);
        double degree = atan(dy / dx);
        
        coords[0] = (x2);
        coords[1] = (y2);
        for (int i = 2; i < coords.length; i += 2) {
            degree += 72*PI/180;
            coords[i] = (int)(x + cos(degree) * r);
            coords[i+1] = (int)(y + sin(degree) * r);
        }
    }
    
    private int distance(int x, int y, int x2, int y2) {
        return (int)sqrt(((x2-x)*(x2-x))+((y2-y)*(y2-y)));
    }

    @Override
    public void draw(Graphics g) {
        g.drawLine(coords[0], coords[1], coords[4], coords[5]);
        g.drawLine(coords[4], coords[5], coords[8], coords[9]);
        g.drawLine(coords[8], coords[9], coords[2], coords[3]);
        g.drawLine(coords[2], coords[3], coords[5], coords[7]);
        g.drawLine(coords[5], coords[7], coords[0], coords[1]);
    }
}