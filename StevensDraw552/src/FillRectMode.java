/**
 *
 * @author justin
 */
public class FillRectMode extends Mode {
    public FillRectMode(){};
    @Override
    public Shape clickdrag(int x, int y, int x2, int y2){
        
        int w = Math.abs(x - x2);
        int h = Math.abs(y - y2);
        x = Math.min(x, x2);
        y = Math.min(y, y2);
        
        return new FillRect(x,y,w,h);
    }
}