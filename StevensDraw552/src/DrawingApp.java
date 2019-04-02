
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.Properties;
import javax.swing.*;

/**
 *
 * @author dkruger

 DrawingApp represents the application contains UI: menus, buttons, etc drawing
 area is in a subsidiary class @see DrawingArea
 *
 */
public class DrawingApp extends JFrame {
    private DrawingArea drawing;
    private Properties prefs;

    private void buildMenus() {
        //JMenuBar b = 

    }

    private class ModeButton extends JButton {
        private Mode m;
        public ModeButton(String label, Mode m) {
            super(label);
            this.m = m;
            addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    drawing.setMode(m);
                }
            });
        }
    }
    
    private void addModeButton(JPanel p, String label, Mode m) {
        ModeButton b = new ModeButton(label, m);
        p.add(b);
    }

    private void buildToolbar() {
        JPanel p = new JPanel();
        p.setLayout(new GridLayout(6, 1));

        addModeButton(p, "Line Mode", DrawingArea.lineMode);
//        addModeButton(p, "Rect Mode", rectMode);

        addModeButton(p, "Cross Mode", DrawingArea.CrossMode);
        getContentPane().add(BorderLayout.WEST, p);
    }

    private void loadPrefs() {
        prefs = new Properties();
        try {
            String current = new java.io.File( "." ).getCanonicalPath();
            System.out.println("Current dir:"+current);
            FileReader fr = new FileReader("draw.conf");
            prefs.load(fr);
        } catch (IOException e) {
            System.out.println(e);
            prefs.setProperty("font", "Times");
            prefs.setProperty("fontSize", "24");
        }

        String fontFamily = prefs.getProperty("font");
        int fontSize = Integer.parseInt(prefs.getProperty("fontSize"));
        int bgColor = (int)Long.parseLong(prefs.getProperty("bgColor"), 16); // read in HEX
        System.out.println(fontFamily + "," + fontSize + "," + bgColor);

        int r, g, b;
        //  this is bgColor:   00000000rrrrrrrrggggggggbbbbbbbb
        r = bgColor >> 16; //  000000000000000000000000rrrrrrrr
        //  0000000000000000rrrrrrrrgggggggg
        //  00000000000000000000000011111111

        g = (bgColor >> 8) & 0xFF; //000000000000000000gggggggg
        b = bgColor & 0xFF;//  000000000000000000000000bbbbbbbb

    }

    private void savePrefs() {
        try {
            FileWriter fw = new FileWriter("draw.conf");
            prefs.store(fw, "test writing prefs?");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public DrawingApp() {
        buildMenus();
        buildToolbar();
        loadPrefs();
        drawing = new DrawingArea();
        Container c = getContentPane();
        c.add(BorderLayout.CENTER, drawing);
        setSize(1000, 800);
        setVisible(true);
    }

    public static void main(String[] args) {
        DrawingApp d = new DrawingApp();
    }
}
