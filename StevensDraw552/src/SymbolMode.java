
public class SymbolMode extends Mode {
	public SymbolMode() {}
    
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new 	Symbol(x, y, x2, y2);
    }
    
}
