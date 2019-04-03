import java.awt.*;
import static java.lang.Math.*;
import java.util.ArrayList;

public class Star extends Shape {
    private int x2, y2, numPoints = 5;
    private int[] coords = new int[numPoints*2];
    private int dx = x2-x, dy = y2-y;
    public Star(int x, int y, int x2, int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
        if (dx == 0) dx = 1;
        if (dy == 0) dy = 1;
        int r = distance(x,y,x2,y2);
        double degree = atan(dy / dx);
        
        coords[0] = (x2); // Top Vertex
        coords[1] = (y2); // Top Vertex
        degree += 72*PI/180;
        coords[2] = (int)(x + cos(degree) * r);
        coords[3] = (int)(y + sin(degree) * r);
        
        degree += 72*PI/180;
        coords[4] = (int)(x + cos(degree) * r);
        coords[5] = (int)(y + sin(degree) * r);
        degree += 72*PI/180;
        coords[6] = (int)(x + cos(degree) * r);
        coords[7] = (int)(y + sin(degree) * r);
        degree += 72*PI/180;
        coords[8] = (int)(x + cos(degree) * r);
        coords[9] = (int)(y + sin(degree) * r);
        
        System.out.println("   ");
        System.out.println(degree);
        System.out.println("X: " + x + " Y: " +y);
        System.out.println("x2: " + x2+ " Y2: "+y2);
        for (int i = 0; i < coords.length; i++) {
            System.out.println(coords[i]);
        }
        System.out.println("   ");
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