import java.awt.*;
import java.util.ArrayList;

public class Star extends Shape {
    private int x2, y2, level = 5;
    private ArrayList<Integer> points;
    public Star(int x, int y, int x2, int y2) {
        super(x,y);
        this.x2 = x2; this.y2 = y2;
        points.add(x2); // Top Vertex
        points.add(y2); // Top Vertex
        
        
    }
    
    private int distance(int x, int y, int x2, int y2) {
        return (int)Math.sqrt(((x2-x)*(x2-x))+((y2-y)*(y2-y)));
    }
    private void getPoints(int orgX,int orgY,int x1,int y1){
        int r = distance(orgX,orgY,x1,y1);
        double degree = Math.tan((orgY - y1) / (orgX - x1));
        for (int i = 0; i < level - 1; i++){
            degree += 72;
            points.add((int)(Math.cos(degree) * r));
            points.add((int)(Math.sin(degree) * r));
        }
        
    }
    
    @Override
    public void draw(Graphics g) {
        for (int i = 0; i <= 4*(level-1); i += 4) {
            g.drawLine(points.get(i), points.get(i+1), points.get(i+2), points.get(i+3));
        }
    }   
}