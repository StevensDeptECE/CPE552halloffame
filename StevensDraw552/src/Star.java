// Authors: Tyler Bryk & Mike Eng

import java.awt.*;
import static java.lang.Math.*;

public class Star extends Shape {
    private int x2, y2, numPoints = 5;
    private final int[] coords = new int[numPoints*2];
    private int dx, dy;
    
    public Star(int x, int y, int x2, int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
        dx = x2-x;
        dy = y2-y;
        
        if (dx == 0) dx = 1;
        if (dy == 0) dy = 1;
        int r = distance(x,y,x2,y2);
        double degree; // radians
        
        if(dy > 0 && dx > 0){
            degree = atan((double)dy / (double)dx);
        } else if(dy < 0 && dx > 0){
            degree = 2 * PI + atan((double)dy / (double)dx);
        } else {
            degree = PI + atan((double)dy / (double)dx);
        }
        
        coords[0] = (x2);
        coords[1] = (y2);
        
        for (int i = 2; i < coords.length; i += 2) {
            degree +=  (360/numPoints)*(PI/180);
                
            
            coords[i] = x + (int)(cos(degree) * r);
            coords[i+1] = y + (int)(sin(degree) * r);
        }
    System.out.println();
    }
    
    private int distance(int x, int y, int x2, int y2) {
        return (int)sqrt(((x2-x)*(x2-x))+((y2-y)*(y2-y)));
    }

    @Override
    public void draw(Graphics g) {
        
        g.drawLine(coords[0], coords[1], coords[4], coords[5]);
        g.drawLine(coords[4], coords[5], coords[8], coords[9]);
        g.drawLine(coords[8], coords[9], coords[2], coords[3]);
        g.drawLine(coords[2], coords[3], coords[6], coords[7]);
        g.drawLine(coords[6], coords[7], coords[0], coords[1]);
        
        g.drawLine(x,y, coords[4], coords[5]);
        g.drawLine(x,y, coords[8], coords[9]);
        g.drawLine(x,y, coords[2], coords[3]);
        g.drawLine(x,y, coords[6], coords[7]);
        g.drawLine(x,y, coords[0], coords[1]);
    }
}