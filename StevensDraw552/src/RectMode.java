/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session07;

/**
 *
 * @author Chesus
 */
public class RectMode extends Mode {

    public RectMode() {}
    @Override
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new Rect(x, y, x2-x, y2-y);
    }
    
}
