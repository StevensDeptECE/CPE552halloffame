

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;

public class DrawingArea extends JPanel {
    private ArrayList<Shape> drawList;
    private Mode mode;
    protected static Mode lineMode = new LineMode();
    protected static Mode rectMode = new RectMode();
    protected static Mode Filledellipse = new filledellipse();
    public DrawingArea() {
        setMode(lineMode);
        drawList = new ArrayList<>();
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