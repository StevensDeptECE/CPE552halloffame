package soloarsystem2D;

import java.awt.*;
import static java.lang.Math.random;
import java.util.ArrayList;
import javax.swing.*;

public class SolarSystem2D extends JFrame{
    SolarSystem2D(){
        super("SolarSystem2D");
        setSize(1450 , 800); 
        Container c=getContentPane();
        c.setBackground(Color.BLACK);
        Star d=new Star();
        c.add(d);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
    public static void main(String args[]){
        new SolarSystem2D();
    }
}

class StartThread extends Thread{
    int x,y,r,d;
    double angle;
    public StartThread(int x,int y,int r,double angle){
        this.x=x;
        this.y=y;
        this.r=r;
        this.d=this.x-725;
        this.angle=angle;
    }
    public void run(){
        double angularv=angle/150;
        while(true){
            this.x=(int) (725-this.d*Math.cos(angle));
            this.y=(int) (400-this.d*Math.sin(angle));
            angle=angle+angularv;
            try {
            sleep(1);
            } catch (InterruptedException e) {
            e.printStackTrace();
            }
        }
    }
}

class Stars{
    int x,y,size;
    public Stars(int x,int y, int size){
        this.x = x;
        this.y = y;
        this.size = size;
    }
}

class Star extends JPanel{
    int j;
    int bx,by,bsize;
    ArrayList<Stars> ss=new ArrayList<>(10);
    StartThread s[]={new StartThread(625,400,10,(Math.PI/10)),new StartThread(575,400,15,(Math.PI/20))
                    ,new StartThread(525,400,15,(Math.PI/15)),new StartThread(475,400,10,(Math.PI/36))
                    ,new StartThread(425,400,30,(Math.PI/40)),new StartThread(375,400,25,(Math.PI/30))
                    ,new StartThread(325,400,20,(Math.PI/25)),new StartThread(275,400,20,(Math.PI/17))};
    public ArrayList<Double> creatrandom(int n){
        ArrayList<Double>  list = new ArrayList<>();
        for(int i=0; i < n; i++){
            list.add(random());
        }
        return list; 
    }
    public Star(){
        for(int i=0;i<s.length;i++)
            s[i].start();
    }
    public void paint(Graphics g) {
        super.paint(g);
        g.setColor(Color.black);
    }

    public void paintComponent(Graphics g0) {
        this.setBackground(Color.black);
        j++;
        if (j % 100 == 0) {
            bx=(int)(creatrandom(10).get(0)*1450);
            by=(int)(800*creatrandom(10).get(0));
            bsize=(int)(creatrandom(10).get(0)*50);
            ss.add(new Stars(bx,by,bsize));
            System.out.println(bx+""+by+""+bsize);
            System.out.println("---->"+ss.size());             
        }
        if (j % 200 == 0){
            ss.remove(0);
        }
        if (j % 2000 == 0){
            ss.remove(0);
            ss.remove(1);
            ss.remove(2);
        }
        for (int i = 0; i < ss.size(); i++) {
            Graphics2D g2 = (Graphics2D) (g0);
            ImageIcon icon2 = new ImageIcon("src/soloarsystem2d/star.jpg");
            g2.drawImage(icon2.getImage(), ss.get(i).x, ss.get(i).y, ss.get(i).size, ss.get(i).size, null);
        }
        Graphics2D g = (Graphics2D) (g0);
        ImageIcon icon = new ImageIcon("src/soloarsystem2d/sun.jpg");
        g.drawImage(icon.getImage(),725-50, 400-50,100,100, null);
       
        for (int i = 0; i < s.length; i++) {
            g = (Graphics2D) (g0);
            ImageIcon[] star = {new ImageIcon("src/soloarsystem2d/Mercury.jpg") , new ImageIcon("src/soloarsystem2d/venus.jpg")
                               ,new ImageIcon("src/soloarsystem2d/earth.jpg")   , new ImageIcon("src/soloarsystem2d/mars.jpg")  
                               ,new ImageIcon("src/soloarsystem2d/jupiter.jpg") , new ImageIcon("src/soloarsystem2d/saturn.jpg")
                               ,new ImageIcon("src/soloarsystem2d/uranus.jpg")  , new ImageIcon("src/soloarsystem2d/neptune.jpg")};
            g.drawImage(star[i].getImage(), s[i].x - s[i].r, s[i].y - s[i].r, 2 * s[i].r, 2 * s[i].r, null);
        }
        repaint();
    }
}
