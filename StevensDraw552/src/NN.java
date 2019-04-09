
import java.awt.Color;
import java.awt.Graphics;
import static java.lang.Math.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author liuyarong caowanying
 */
public class NN extends Shape{
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
        System.out.println(len);
        double r=len/2;
        double ang=2*PI/n;
        double midX=(x+x2)/2;
        double midY=(y+y2)/2;
        int px[]=new int [n];
        int py[]=new int [n];
        for(int i=0;i<n;i++){
            px[i]=(int)(r*Math.cos(ang*i)+midX);
            System.out.println(px[i]);
            py[i]=(int)(midY-r*Math.sin(ang*i));
            System.out.println(py[i]);
        }
        //g.setColor(Color.blue);
        g.drawPolygon(px,py,n);
    }
    
}
    

