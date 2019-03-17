/**
 *  @author Tyler Bryk
 *  I pledge my honor that I have abided by the Stevens Honor System
 * 
 *  Inspired by OpenProcessing.org
 *  Attempt at modeling Processing sketch in Java Swing
 *  NOTE: The model works however it appears that the CPU is processing the code much faster than
 *  it can render to the display output. I unsuccessfully researched this but could not find a fix. 
 *  This was my attempt at getting it to work. 
 */

import javax.swing.*;
import java.awt.*;
import java.awt.geom.*;

public class ParametricCurvesSwing extends JFrame {
    private float t, lineColor;
    private final int width = 600, height = 600, numLine = 15;
    Color bg = new Color(40,40,40);
    public ParametricCurvesSwing() {
        super("Created by: Tyler Bryk");
        setSize(width,height);
        Container content = getContentPane();
        content.setBackground(bg);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setVisible(true);
    }
    
    public void paint(Graphics gIn) {
        super.paint(gIn); 
        Graphics2D gPane = (Graphics2D) gIn;
        gPane.translate(width/2, height/2);
        gPane.setStroke(new BasicStroke(5));
        
        for (int cnt = 0; cnt < 100000; cnt++) {
            gPane.setColor(Color.WHITE);
            for (int i = 0; i < numLine; i++)
                gPane.draw(new Line2D.Double(x1(t+i), y1(t+i), x2(t+i), y2(t+i)));
            gPane.setColor(bg);
            for (int i = 0; i < numLine; i++)
                gPane.draw(new Line2D.Double(x1(t+i), y1(t+i), x2(t+i), y2(t+i)));
            t += 0.6;
        }
    }
        
    double x1 (float t) {return 100*Math.sin(t/10) + 20*Math.sin(t/5);}
    double y1 (float t) {return 100*Math.cos(t/10) + 20*Math.sin(t/5);}
    double x2 (float t) {return 200*Math.sin(t/20) + Math.sin(t/12);}
    double y2 (float t) {return 200*Math.cos(t/20) + Math.cos(t/12);}
    
    public static void main(String[] args) {
        new ParametricCurvesSwing();
    }
}