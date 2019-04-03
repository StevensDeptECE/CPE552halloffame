/**
 * @author caowanying
 */
import java.awt.*;
import javax.swing.*;


public class NN extends Shape {
    private int x2, y2;
    private int n;
    public NN(int x, int y, int x2, int y2, int n) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
        this.n=n;
    }
    @Override        
    public void draw(Graphics g) {
        double len= Math.sqrt((y2-y)*(y2-y)+(x2-x)*(x2-x));
        double r=len/2;
        double ang=360/n;
        double midX=(x+x2)/2;
        double midY=(y+y2)/2;
        int px[]=new int [n];
        int py[]=new int [n];
        for(int i=0;i<n;i++){
            px[i]=(int)(r*Math.cos(ang)+midX);
            py[i]=(int)(r*Math.sin(ang)+midY);
        }
        g.setColor(Color.blue);
        g.drawPolygon(px,py,n);
    }
   
}

