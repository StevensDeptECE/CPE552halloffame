//Author: Chenhui Yang
//Cite: http://paulbourke.net/fractals/

import java.awt.*;
import javax.swing.*;

public class drawDream {
    public void showUI() {
        JFrame jf=new JFrame();
        jf.setTitle("PaintBoard");
        jf.setSize(1200,1200);
        jf.setResizable(false);
        jf.setDefaultCloseOperation(3);
        jf.setLocationRelativeTo(null);
        jf.setLayout(new FlowLayout());
        jf.setBackground(Color.WHITE);
        DrawListener drawL = new DrawListener();
        jf.addMouseListener(drawL);

        String name[]= {"Leaves","CurlyLeaves","Bracelet"};
        for(int i=0;i<name.length;i++) {
            JButton btn=new JButton(name[i]);
            jf.add(btn);
            btn.addActionListener(drawL);
        }

        jf.setVisible(true);
        Graphics g=jf.getGraphics();
        drawL.setG(g);
    }

    public static void main(String[] args) {
        drawDream sd=new drawDream();
        sd.showUI();
    }
}
