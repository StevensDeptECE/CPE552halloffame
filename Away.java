
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import static java.lang.Math.random;
import static java.lang.Math.*;

/**
 *
 * @author hexintang
 */
public class Away extends JFrame {
    
    public void buildMenus(){
        JMenuBar mb = new JMenuBar();
        JMenu m = new JMenu("File");
        JMenuItem mi1 = new JMenuItem("Exit");
        mi1.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                System.exit(0);
            }
        });
        JMenuItem mi2 = new JMenuItem("Introduction");
        mi2.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                new Introduction();
            }
        });
        mb.add(m);
        m.add(mi1);
        m.add(mi2);
        setJMenuBar(mb);
    }

    public Away() {
        setSize(800, 800);
        buildMenus();
        setLocationRelativeTo(null);
        Container c = getContentPane();

        AttackBoard a = new AttackBoard();
        c.add(a);

        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {
        new Away();

    }

}

class Attack extends Thread {

    int x, y, dx, dy, size;

    public Attack(int x, int y, int size) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.dx = (int) (random() * 5);
        this.dy = (int) (random() * 5);
    }

    public void run() {
        while (true) {
            x = x + dx;
            y = y + dy;
            if (y >= (800 - size / 2) || y <= (size / 2)) {
                dy = -dy;
            }
            if (x >= (800 - size / 2) || x <= (size / 2)) {
                dx = -dx;
            }
            try {
                Thread.sleep(50);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

class AttackBoard extends JPanel implements KeyListener {

    Attack[] a = new Attack[8];
    int flag = 0;
    int plane_x, plane_y, plane_size;

    public AttackBoard() {

        setFocusable(true);
        addKeyListener(this);

        plane_x = 100;
        plane_y = 100;
        plane_size = 50;

        a[0] = new Attack(300, 100, 10);
        a[1] = new Attack(500, 100, 10);
        a[2] = new Attack(300, 700, 10);
        a[3] = new Attack(500, 700, 10);
        a[4] = new Attack(100, 300, 10);
        a[5] = new Attack(100, 500, 10);
        a[6] = new Attack(700, 300, 10);
        a[7] = new Attack(700, 500, 10);
        for (int i = 0; i < a.length; i++) {
            a[i].start();
        }
        
    }

    public void paintComponent(Graphics g) {
        g.setColor(Color.red);
        for (int i = 0; i < a.length; i++) {
            g.drawOval(a[i].x, a[i].y, a[i].size, a[i].size);
        }

        g.setColor(Color.blue);
        if (flag == 1) {
            g.drawOval(plane_x, plane_y, plane_size, plane_size);
        }
        
        collision();

        repaint();
    }

    public void keyTyped(KeyEvent e) {
    }

    public void keyPressed(KeyEvent e) {
        if (e.getKeyCode() == KeyEvent.VK_SPACE) {
            flag = 1;
        }
        if (e.getKeyCode() == KeyEvent.VK_W) {
            plane_y -= 10;
        }
        if (e.getKeyCode() == KeyEvent.VK_A) {
            plane_x -= 10;
        }
        if (e.getKeyCode() == KeyEvent.VK_S) {
            plane_y += 10;
        }
        if (e.getKeyCode() == KeyEvent.VK_D) {
            plane_x += 10;
        }
    }

    public void keyReleased(KeyEvent e) {
    }

    public void collision() {
        double distance;
        double jgdistance;
        jgdistance = (double) (a[0].size / 2 + plane_size);
        
        for (int i = 0; i < a.length; i++) {
            distance = sqrt(pow((plane_x - a[i].x), 2) + pow((plane_y - a[i].y), 2));
            if (distance <= jgdistance) {
                flag = 0;
                break;
            }
        }
        
    }

}


class Introduction extends JFrame{
    public Introduction(){
        setSize(400,400);
        setLocationRelativeTo(null);
        this.addWindowListener(new WindowListener(){
            public void windowClosing(WindowEvent e){
                dispose();
            }
            
            public void windowOpened(WindowEvent e) {}
            public void windowClosed(WindowEvent e) {}
            public void windowIconified(WindowEvent e) {}
            public void windowDeiconified(WindowEvent e) {}
            public void windowActivated(WindowEvent e) {}
            public void windowDeactivated(WindowEvent e) {}
        });
        Container c = getContentPane();
        setVisible(true);
    }
    public void paint(Graphics g){
        g.setFont(new Font("Times",Font.PLAIN, 24));
        g.drawString("Space:      Start", 50, 100);
        g.drawString("W:             Up", 50, 150);
        g.drawString("A:           Left", 50, 200);
        g.drawString("S:           Down", 50, 250);
        g.drawString("D:          Right", 50, 300);
    }
}
