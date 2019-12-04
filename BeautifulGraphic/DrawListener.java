//Author: Chenhui Yang
//Cite: http://paulbourke.net/fractals/

import java.awt.*;
import java.awt.event.*;
import java.util.*;

public class DrawListener implements MouseListener,ActionListener{
    Graphics g;
    String type;
    public void setG(Graphics arg){
        g = arg;
    }

    public void actionPerformed(ActionEvent e) {
        String action=e.getActionCommand();
        type=action;
    }

    public void mouseReleased(MouseEvent e) {
        if("Leaves".equals(type)) {
            Leaves();
        }
        else if("CurlyLeaves".equals(type)) {
            CurlyLeaves();
        }
        else if("Bracelet".equals(type)) {
            Bracelet();
        }

    }

    public void Leaves() {
        double a,b,c,d,ee,f;
        double x=0f,y=0f;

        for(int i=0;i<200000;i++) {
            g.setColor(Color.green);
            Random rr=new Random();
            int r=rr.nextInt(100);
            if(r==0) {
                a=0;b=0;c=0;d=0.16;ee=0;f=0;
            }
            else if(r>=1&&r<=7) {
                a=0.2;b=-0.26;c=0.23;d=0.22;ee=0;f=1.6;
            }
            else if(r>=8&&r<=14) {
                a=-0.15;b=0.28;c=0.26;d=0.24;ee=0;f=0.44;
            }
            else {
                a=0.85;b=0.04;c=-0.04;d=0.85;ee=0;f=1.6;
            }
            double temx=a*x+b*y+ee;
            double temy=c*x+d*y+f;
            int x1=-(int)(temx*60)+300;
            int y1=-(int)(temy*60)+500;
            //System.out.print(" x"+x+" y"+y);
            g.drawLine(x1+200, y1+150, x1+200, y1+150);
            x=temx;
            y=temy;
        }
    }
    public void CurlyLeaves() {
        double a,b,c,d,ee,f;
        double x=0f,y=0f;

        for(int i=0;i<200000;i++) {
            //g.setColor(Color.BLUE);
            Random rr=new Random();
            int r=rr.nextInt(8);
            if(r>=0&&r<=3) {
                a=0;b=-0.41;c=0.39;d=0;ee=-0.28;f=-0.185;
                g.setColor(Color.BLUE);
            }
            else if(r>=4&&r<=6) {
                a=0.7;b=0.33;c=-0.35;d=0.7;ee=0.185;f=0.015;
                g.setColor(Color.red);
            }
            else  {
                a=0;b=0.175;c=0.013;d=0.46;ee=-0.095;f=-0.285;
                g.setColor(Color.yellow);
            }
            double temx=a*x+b*y+ee;
            double temy=c*x+d*y+f;
            int x1=(int)(temx*600)+300;
            int y1=-(int)(temy*600)+50;
            //System.out.print(" x"+x+" y"+y);
            g.drawLine(x1+200, y1+150, x1+200, y1+150);
            x=temx;
            y=temy;
        }
    }
    public void Bracelet() {
        double a=1.4,b=1.56,c=1.4,d=-6.56;
        double x=0f,y=0f;

        for(int i=0;i<20000;i++) {

            g.setColor(Color.cyan);

            double temx=d*Math.sin(a*x)-Math.sin(b*y);
            double temy=c*Math.cos(a*x)+Math.cos(b*y);
            int x1=(int)(temx*30)+300;
            int y1=-(int)(temy*30)+50;
            //System.out.print(" x"+x+" y"+y);
            g.drawLine(x1+200, y1+300, x1+200, y1+300);
            x=temx;
            y=temy;
        }
    }
    public void mousePressed(MouseEvent e) {}
    public void mouseClicked(MouseEvent e) {}
    public void mouseEntered(MouseEvent e) {}
    public void mouseExited(MouseEvent e) {}
}




