/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Class2020
 */
import java.math.*;
public class CircleMode extends Mode{
    public CircleMode(){  
    }
    @Override
    public Shape clickdrag(int x, int y, int x2, int y2) {
        return new Circle(x,y,x2, y2);
    }
}