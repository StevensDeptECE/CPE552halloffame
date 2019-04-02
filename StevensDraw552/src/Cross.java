/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Weitai Wen 
 * 
 */
import java.awt.*; 

public class Cross extends Shape {
  private int x2, y2;
  private int edge;
  private int side;
  public Cross (int x, int y, int x2, int y2) {
    super(x, y);
    this.x2 = x2;
    this.y2 = y2;
    if (x == x2 || y == y2) {
      edge = 10;
      side = 20;
    } else {
      edge = Math.abs(x2 - x);
      side = Math.abs((int)((y2 - y) / 2.0));
    }
            
  } 
  // a right cross with edge length 10 and side length 15
  @Override        
  public void draw(Graphics g) {
  
    int[] xPoint = new int[12];
    initialX(xPoint);
    int [] yPoint = new int[12]; 
    initialY(yPoint);
    g.drawPolygon(xPoint, yPoint, 12);
//    Point[] position = new Point[12];
//    position[0] = 
//    g.drawLine(x - edge / 2, y - edge / 2 + side, x + edge / 2 , y - edge / 2 + side);
//    g.drawLine()
  }
  
  private void initialX(int[] arr) {
//    for (int i = 0; i < arr.length; i+=2) {
//        arr[i] = x - edge / 2;
//        arr[i + 1] = x - edge/2;
//    }
      arr[0] = x - edge / 2;
      arr[1] = x - edge / 2;
      arr[2] = x + edge / 2;
      arr[3] = x + edge / 2;
      arr[4] = x + edge / 2 + side; 
      arr[5] = x + edge / 2 + side;
      arr[6] = x + edge / 2;
      arr[7] = x + edge / 2;
      arr[8] = x - edge / 2;
      arr[9] = x - edge / 2;
      arr[10] = x - edge / 2 - side;
      arr[11] = x - edge / 2 - side;
  }
  
  private void initialY(int[] arr) {
      arr[0] = y - edge / 2;
      arr[1] = y - edge / 2 - side;
      arr[2] = y - edge / 2 - side;
      arr[3] = y - edge / 2;
      arr[4] = y - edge / 2; 
      arr[5] = y + edge / 2;
      arr[6] = y + edge / 2;
      arr[7] = y + edge / 2 + side;
      arr[8] = y + edge / 2 + side;
      arr[9] = y + edge / 2;
      arr[10] = y + edge / 2;
      arr[11] = y - edge / 2;      
  }
} //class
  
