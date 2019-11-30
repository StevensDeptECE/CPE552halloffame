package WeiQi;

import java.awt.event.*;
import java.awt.*;
import javax.swing.*;

/**
 *
 * @author Jiaxian Xing
 */
public class fantastic extends JFrame {

    public fantastic() {
        super("fantastic Grap");
        setSize(850, 850);
        buildMenus();// build the menu to frame
        gameBoard gb = new gameBoard();
        Container c = getContentPane();
        c.add(BorderLayout.CENTER, gb);
        JButton bu = new JButton(":-) clear");
        bu.setFont(new Font("Arial", Font.BOLD, 40));
        bu.setBackground(new Color(240, 240, 240));
        bu.addActionListener(new ActionListener() {// Game$1
            public void actionPerformed(ActionEvent e) {
                gb.clearBoard();
                gb.repaint();
            }
        });
        c.add(BorderLayout.NORTH, bu);
        JTextField t = new JTextField("https://zh.wikipedia.org/wiki/%E5%9B%B4%E6%A3%8B");
        c.add(BorderLayout.PAGE_END, t);
        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    private void buildMenus() {
        JMenuBar mb = new JMenuBar();
        JMenu m = new JMenu("File");
        JMenuItem mi = new JMenuItem("New");
        ActionListener a = new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.out.println("new");
            }
        };
        mi.addActionListener(a);
        m.add(mi);// add the "New" item to the menu "File"
        // create an item "Quit"
        mi = new JMenuItem("Quit");
        mi.addActionListener(new ActionListener() {// Game$1
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        m.add(mi);// add the "Quit" item to the menu "File"
        mb.add(m);// add the "File" menu to menu bar
        m = new JMenu("Edit");
        mi = new JMenuItem("Set Size");
        mi.addActionListener(new ActionListener() {// Game$2
            public void actionPerformed(ActionEvent e) {
                System.out.println("Using Default Size 19 * 19");
            }
        });
        m.add(mi);// add the "Set Size" item to the menu "Edit"
        mb.add(m);// add the "Edit" menu to menu bar
        m = new JMenu("View");
        mb.add(m);// add the "View" menu to menu bar
        setJMenuBar(mb);// add the menu bar to frame
    }

    public static void main(String[] args) {
        fantastic w = new fantastic();
    }
}

class gameBoard extends JPanel {

    private int stoneBoard[][];// 0: null 1: white 2: black
    private int boardLineSize = 9;
    private int stoneHeight, stoneWidth;

    public gameBoard() {
        stoneBoard = new int[boardLineSize][boardLineSize];
        // MoveListener m = new MoveListener();
        // addMouseListener(m);
        // addMouseMotionListener(m);
        for (int i = 0; i < boardLineSize; i++) {
            for (int j = 0; j < boardLineSize; j++) {
                if ((i + j) % 2 == 0)
                    stoneBoard[i][j] = 1;
                else
                    stoneBoard[i][j] = 0;
            }
        }
    }

    void clearBoard() {
        for (int i = 0; i < boardLineSize; i++) {
            for (int j = 0; j < boardLineSize; j++) {
                stoneBoard[i][j] = 1
            }
        }
    }

    @Override
    public void paint(Graphics g) {
        super.paint(g);
        // draw the weiqi grid board.
        // g.drawImage(arg0, 0, 0, ERROR, ERROR, this);
        stoneWidth = g.getClipBounds().width / boardLineSize;
        stoneHeight = g.getClipBounds().height / boardLineSize;
        for (int i = 0; i < boardLineSize; i++) {
            // TODO: some problem on the int border here!
            // herizontal line
            g.drawLine(0 + (stoneWidth / 2), i * stoneHeight + (stoneHeight / 2),
                    g.getClipBounds().width - (stoneWidth / 2), i * stoneHeight + (stoneHeight / 2));
            // vertical line
            g.drawLine(i * stoneWidth + (stoneWidth / 2), 0 + stoneHeight / 2, i * stoneWidth + (stoneWidth / 2),
                    g.getClipBounds().height - (stoneHeight / 2));
        }

        // draw the wei qi at initial status.
        for (int i = 0; i < boardLineSize; i++) {
            for (int j = 0; j < boardLineSize; j++) {
                // System.out.print(board[i][j]);
                if (stoneBoard[i][j] != 0) {
                    g.setColor(stoneBoard[i][j] == 1 ? Color.white : Color.black);
                    g.fillOval(i * stoneWidth, j * stoneHeight, stoneWidth, stoneHeight);
                }
            }
        }
    }

    // class MoveListener implements MouseListener, MouseMotionListener {// inner
    // class

    // private int lastX, lastY;
    // private boolean Player = true;//true is white, false is black!
    // private boolean MoveStone = false;

    // @Override
    // public void mouseClicked(MouseEvent arg0) {
    // }

    // @Override
    // public void mouseDragged(MouseEvent e) {
    // // chess:
    // // System.out.println("MouseEvent: mouseDragged");
    // //
    // // Graphics g = gameBoard.this.getGraphics();
    // // g.setXORMode(Player != true ? Color.WHITE : Color.BLACK);
    // // g.fillOval(lastX, lastY, stoneWidth, stoneHeight);
    // //
    // // int x = e.getX() - stoneWidth / 2;
    // // int y = e.getY() - stoneHeight / 2;
    // // g.fillOval(x, y, stoneWidth, stoneHeight);
    // // lastX = x;
    // // lastY = y;
    // // MoveStone = true;
    // }

    // @Override
    // public void mouseEntered(MouseEvent arg0
    // ) {
    // }

    // @Override
    // public void mouseExited(MouseEvent arg0
    // ) {
    // }

    // @Override
    // public void mouseMoved(MouseEvent arg0
    // ) {
    // }

    // @Override
    // public void mousePressed(MouseEvent e
    // ) {
    // System.out.println("MouseEvent: mousePressed");

    // Graphics g = gameBoard.this.getGraphics();
    // // add to new location on board
    // int x = e.getX() / stoneWidth * stoneWidth;// Grid snap
    // int y = e.getY() / stoneHeight * stoneHeight;
    // lastX = x;
    // lastY = y;
    // MoveStone = false;
    // if (stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] == 0) {//not
    // have one at this pos
    // //put new
    // if (Player == true) {
    // stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] = 1;//true is
    // white, false is black!
    // } else {
    // stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] = 2;//true is
    // white, false is black!
    // }
    // g.setColor(Player == true ? Color.WHITE : Color.BLACK);
    // g.fillOval(x, y, stoneWidth, stoneHeight);
    // Player = !Player;
    // } else {//already have one!
    // //don't put!
    // // chess:
    // // stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] = 0;
    // }

    // }

    // @Override
    // public void mouseReleased(MouseEvent e) {
    // System.out.println("MouseEvent: mouseReleased");
    // Graphics g = gameBoard.this.getGraphics();
    // // chess:
    // // if (MoveStone == true) {//which means you drage you stone to here.
    // // g.setXORMode(Player != true ? Color.WHITE : Color.BLACK);
    // // g.fillOval(lastX, lastY, stoneWidth, stoneHeight);
    // // Player = !Player;
    // // }
    // if (stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] == 0) {//not
    // have one stone at this pos Just Put Here!
    // int x = e.getX() / stoneWidth * stoneWidth;// Grid snap
    // int y = e.getY() / stoneHeight * stoneHeight;
    // if (Player == true) {
    // stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] = 1;
    // } else {
    // stoneBoard[e.getX() / stoneWidth][e.getY() / stoneHeight] = 2;
    // }
    // g.setColor(Player == true ? Color.WHITE : Color.BLACK);
    // g.fillOval(x, y, stoneWidth, stoneHeight);
    // lastX = x;
    // lastY = y;
    // Player = !Player;
    // } else {//already have one! Not drop stone Here!
    // }
    // for (int i = 0; i < boardLineSize; i++) {
    // for (int j = 0; j < boardLineSize; j++) {
    // System.out.print(stoneBoard[j][i] + " ");
    // }
    // System.out.println();
    // }
    // gameBoard gb = gameBoard.this;
    // gb.repaint();

    // }

}
