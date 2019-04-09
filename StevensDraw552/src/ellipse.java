/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 18580
 */
import java.awt.*;
/**
 *
 * @author dkruger
 */
public class ellipse extends Shape {
    private int x2, y2;
    
    public ellipse(int x, int y, int x2, int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
    }

    @Override        
    public void draw(Graphics g) {
        g.setColor(Color.red);
        
        g.fillOval((x+x2)/2, (y+y2)/2, Math.abs(x2-x), Math.abs(y2-y));
    }
}

