
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
/**
 * @author dkruger
 */
public class DrawingArea extends JPanel {
    private ArrayList<Shape> drawList;
    private Mode mode;
    protected static Mode lineMode = new LineMode();
    protected static Mode Filledellipse = new filledellipse();
    
//    private static Mode rectMode = new RectMode();
    public DrawingArea() {
        setMode(lineMode);
        drawList = new ArrayList<>();
        drawList.add(new Line(0,0, 300, 200));
        drawList.add(new Rect(100,300, 200, 400));
        addMouseListener(new HandleMouseEvents());
    }

    public void setMode(Mode m) {
        mode = m;
    }
    
    private class HandleMouseEvents extends MouseAdapter {
        private int startX, startY;
        @Override
        public void mousePressed(MouseEvent me) {
            startX = me.getX(); startY = me.getY();
        }

        @Override
        public void mouseReleased(MouseEvent me) {
            Graphics g = getGraphics();
            Shape s = mode.clickdrag(startX, startY, me.getX(), me.getY());
            drawList.add(s);
            s.draw(g);
        }
    }
    
    
    public void paint(Graphics g) {
        for (Shape s : drawList)
            s.draw(g);
    }
}
