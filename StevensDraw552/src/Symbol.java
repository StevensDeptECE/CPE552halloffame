
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.*;
import javax.imageio.*;
import javax.swing.JPanel;

public class Symbol extends Shape{
	private int x2, y2;
	private BufferedImage image;
    
    public Symbol(int x, int y, int x2, int y2) {
        super(x, y);
        //JPanel pic = new JPanel();
        this.x2 = x2; this.y2 = y2;
        try {                
            image = ImageIO.read(new File("src/resistor.png"));
         } catch (IOException ex) {
              // handle exception...
         }
    }
   
    
    

	@Override
	public void draw(Graphics g) {
		
		g.drawImage(image, x, y, x2, y2, null);
		
	}




	
}
   
    

	
    
    
     


