
import java.awt.*;
import javax.swing.*;
/**
 *
 * @author Ruijie Zhai
 */
public class Arrow extends Shape{
    private int x2,y2;
    public Arrow(int x, int y, int x2, int y2){
        super(x,y);
        this.x2=x2;
        this.y2=y2;
    }
    @Override
    public void draw(Graphics g){
        g.drawLine(x, y, x2, y2);
        int k=((x2-x)*(x2-x)/(x2-x)*(x2-x)+(y2-y)*(y2-y));
        g.drawOval(x2-5, y2-5, 10,10);
        
        
        //g.drawLine(x2, y2, (x2-10)*-k, (y2-10)/-k);
       
    }

    
}
