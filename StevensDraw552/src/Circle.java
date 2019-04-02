/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Class2020
 */
import java.awt.*;
import static java.lang.Math.sqrt;
public class Circle extends Shape{
    private int x2,y2;
    private int r;
    public Circle(int x, int y, int x2, int y2){
        super(x,y);
        this.x2=x2;
        this.y2=y2;
        r=(int)(sqrt((x2-x)*(x2-x)+(y2-y)*(y2-y)));
        
    }
    @Override
    public void draw(Graphics g){
        g.drawOval(x,y,r,r);
    }
}
