/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Siyang & Ziang
 */
public class TriangleMode extends Mode {
    public TriangleMode() {}

    @Override
    public Shape clickdrag(int x, int y, int x2,int y2) {
        return new Triangle(x, y, x2, y2);
       
    }

}

