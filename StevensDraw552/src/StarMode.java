public class StarMode extends Mode {
    public StarMode() {}
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new Star(x,y,x2,y2);
    }
}
