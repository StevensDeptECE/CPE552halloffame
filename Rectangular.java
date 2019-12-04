import javax.swing.*;
import java.awt.*;
import static java.lang.Math.random;
import java.util.*;

/**
 * @author Jiayi Sun
 */
public class Rectangular extends JFrame {
    public Rectangular() {
        setSize(800, 800);
        Container c = getContentPane();
        RecBoard r = new RecBoard();
        c.add(r);
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    public static void main(String[] args) {
        new Rectangular();
    }
}

class RecInfo extends Thread {
    int x, y, length, change;
    int flag = 1;
    int count1 = 0;
    int count2 = 0;
    public RecInfo(int x, int y, int length, int change) {
        this.x = x;
        this.y = y;
        this.length = length;
        this.change = change;
    }
    public void run() {
        while (true) {
            if (flag == 1) {
                length += change;
                x = x - change / 2;
                y = y - change / 2;
                try {
                    Thread.sleep(300);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                count1++;
                if (count1 == 5) {
                    flag = -flag;
                    count1 = 0;
                }
            }
            if (flag == -1) {
                length -= change;
                x = x + change / 2;
                y = y + change / 2;
                try {
                    Thread.sleep(300);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                count2++;
                if (count2 == 5) {
                    flag = -flag;
                    count2 = 0;
                }
            }
        }
    }
}

class RecBoard extends JPanel {
    public ArrayList<RecInfo> r;
    int count = 0; // add more rects
    int j = 0;
    public RecBoard() {
        r = new ArrayList<>();
        r.add(new RecInfo((int) (random() * 700 + 100), (int) (random() * 700 + 100), 15, 5));
        r.get(0).start();
    }

    public void paintComponent(Graphics g) {
        count++;
        int a = (int)(Math.random()*255)+1;
        int b = (int)(Math.random()*255)+1;
        int c = (int)(Math.random()*255)+1;
        g.setColor(new Color(a,b,c));
        for (int i = 0; i < r.size(); i++) {
            g.fillRect(r.get(i).x, r.get(i).y, r.get(i).length, r.get(i).length);
        }
        if (count % 500 == 0) {
            r.add(new RecInfo((int) (random() * 700 + 100), (int) (random() * 700 + 100), 15, 5));
            j++;
            r.get(j).start();
        }
        if (count == 5000) {
            count = 0; //start over in case count is too big and over flow
        }
        repaint(); //loop again
    }
}
