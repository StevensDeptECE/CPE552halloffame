/**
 *  @author Tyler Bryk
 *  I pledge my honor that I have abided by the Stevens Honor System
 * 
 *  Inspired by OpenProcessing.org
 *  Attempt at modeling Processing sketch in Java with the Processing API
 *  NOTE: I was not able to set the colorMode to HSB which limited the color range
 */

import processing.core.*;

public class ParametricCurves extends PApplet {
    private float t, lineColor;
    private final int numLine = 15;
    public void settings() {
        size(600,600);
    }
    
    public void draw() {
        background(40);
        strokeWeight(5);
        translate(width/2, height/2);
        if (lineColor >= 255) lineColor = 0;
        else lineColor += 0.5;
        stroke(lineColor,100,255);
        for (int i = 0; i < numLine; i++)
            line(x1(t+i), y1(t+i), x2(t+i), y2(t+i));
        t += 0.6;
    }
        
    float x1 (float t) {return 100*sin(t/10) + 20*sin(t/5);}
    float y1 (float t) {return 100*cos(t/10) + 20*sin(t/5);}
    float x2 (float t) {return 200*sin(t/20) + sin(t/12);}
    float y2 (float t) {return 200*cos(t/20) + cos(t/12);}
    
    public static void main(String[] args) {
        PApplet.main("ParametricCurves");
    }
}
