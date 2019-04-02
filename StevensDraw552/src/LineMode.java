

public class LineMode extends Mode {

    public LineMode() {}

    @Override
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new Line(x, y, x2, y2);
    }

}
