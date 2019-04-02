

public class RectMode extends Mode{

    public RectMode() {}

    @Override
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new Rect(x, y, x2, y2);
    }
}
