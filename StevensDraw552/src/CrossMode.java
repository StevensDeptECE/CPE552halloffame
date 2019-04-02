/**
 *
 * @author Weitai Wen 
 */
public class CrossMode extends Mode {

    public CrossMode() {}
    @Override
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new Cross(x, y, x2, y2);
    }
    
}
