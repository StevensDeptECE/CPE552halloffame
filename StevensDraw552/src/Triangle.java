
import java.awt.Graphics;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Siyang & Ziang
 */
public class Triangle extends Shape {
    private int x2, y2;
    private double L,a,x3,y3;
    public Triangle(int x, int y, int x2,int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
    }

 public void draw(Graphics g) {
     L=Math.sqrt((y-y2)*(y-y2)+(x-x2)*(x-x2));
     a=Math.atan((y-y2)/(x-x2));
     x3=x2+L*Math.cos(a+60);
     y3=y2+L*Math.sin(a+60);
            g.drawLine(x,y,x2,y2);
            g.drawLine(x2,y2,(int)x3,(int)y3);
            g.drawLine(x,y,(int)x3,(int)y3);
    }
}