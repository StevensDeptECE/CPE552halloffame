import java.awt.*;
/**
 *
 * @author justin
 */
public class FillRect extends Shape {
    private int w, h;
    
    public FillRect(int x, int y, int w, int h){
        super(x,y);
        this.w = w; this.h = h;
    }

    @Override
    public void draw(Graphics g){
        g.fillRect(x, y, w, h);
    }  
}