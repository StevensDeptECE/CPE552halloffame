/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 18580
 */
public class filledellipse extends Mode {

    public filledellipse() {}
    @Override
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new ellipse(x, y, x2, y2);
    }
    
}
    

