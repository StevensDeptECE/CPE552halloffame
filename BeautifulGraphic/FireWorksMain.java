package graphic;


import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;

import javax.swing.*;

class FireWorksThread extends Thread {
	private static JPanel panel;
	Graphics g;
	
	private ArrayList<Particle> pr = new ArrayList<>();
	
	private int startX = (int) (800 * Math.random()), startY = (int) (800 * Math.random());

	public FireWorksThread(JPanel panel) {
		this.panel = panel;
	}

	public void setStartXY(int x, int y) {
		this.startX = x;
		this.startY = y;
	}

	public void run() {
		
		double dt = 0.5d;  
		while (true) {
			
			g = panel.getGraphics();

			
			Particle tp = new Particle();
			tp.position = new VecT(startX, startY);
			tp.velocity = new VecT(10, -20);
			tp.acceleration = sampleDirection();
			tp.life = 30;
			tp.age = 1;
			tp.color = new Color(255, 0, 255);
			tp.size = 12;
			pr.add(tp);

			
			Image image = panel.createImage(panel.getWidth(), panel.getHeight());
			Graphics2D bg = (Graphics2D) image.getGraphics();

			bg.setColor(Color.black);
			bg.fillRect(0, 0, panel.getWidth(), panel.getHeight());
			bg.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
			for (int i = 0; i < pr.size(); ++i) {
				Particle p = pr.get(i);
				
				p.age += dt;
				if (p.age >= p.life) {
					pr.remove(i);
				}
				
				int r = p.color.getRGB();
				r -= 1000;
				Color c = new Color(r);
				p.color = c;
				
				isrebound(p);
				p.position = p.position.add(p.velocity.multiply(dt));
				p.velocity = p.velocity.add(p.acceleration.multiply(dt));
				
				bg.setColor(p.color);
				
				Image imge = Toolkit.getDefaultToolkit().getImage("Sakura.jpg");
				g.drawImage(imge,p.getX() - 20, p.getY() - 20, 40, 40, null);
				
//				bg.fillOval(p.getX(), p.getY(), p.size, p.size);
			}
			
			g.drawImage(image, 0, 0, null);
			try {
				Thread.sleep(10);
			} catch (Exception ef) {
			}
		}
	}

	
	public static void isrebound(Particle p) {
		if (p.getX() <= 0 || p.getX() >= panel.getWidth())
			p.velocity.x *= -1;
		if (p.getY() <= 0 || p.getY() >= panel.getHeight())
			p.velocity.y *= -1;
	}
	
	public static VecT sampleDirection() {
		double theta = Math.random() * 2 * Math.PI;
		return new VecT((Math.cos(theta)), (Math.sin(theta)));
	}
}



class Particle {
	
	public VecT position,velocity,acceleration;
	public Color color;
	public double life,age,start_time;
	public int size;
	
	public int x,y;
	public int getX(){
		return (int)position.x;
	}
	public int getY(){
		return (int)position.y;
	}
}


class VecT {
	public double x, y;

	public VecT(double x, double y) {
		this.x = x;
		this.y = y;
	}

	
	public VecT add(VecT p) {
		return new VecT(this.x + p.x, this.y + p.y);
	}

	
	public VecT multiply(double f) {
		return new VecT(this.x * f, this.y * f);
	}

}

class FwListener extends MouseAdapter {
	FireWorksThread ft;

	public FwListener(FireWorksThread ft) {
		this.ft = ft;
	}

	public void mouseDragged(MouseEvent e) {
		ft.setStartXY(e.getX(), e.getY());
	}
	
	public void mousePressed(MouseEvent e) {
		ft.setStartXY(e.getX(), e.getY());
	}
}


public class FireWorksMain extends JPanel {



public static void main(String[] args) {

FireWorksMain fw = new FireWorksMain();

fw.initUI();

}



public void initUI() {

JFrame f = new JFrame();

f.setTitle("fireworks");

f.setSize(800, 800);

f.setDefaultCloseOperation(3);

f.add(this);

f.setVisible(true);



FireWorksThread ft = new FireWorksThread(this);

ft.start();

FwListener fl=new FwListener(ft);

this.addMouseMotionListener(fl);

}

}