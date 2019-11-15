/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quiz;
// write a gui editor to let the user select colors and font 
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionListener;
import java.util.HashMap;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.*;

/**
 *
 * @author Shaheen Parveen
 
 background 000000
foreground FFFFFF
titlefont	Helvetica
titlefontsize	24
questionfont	Times
questionsize	20*/
public class GUIEditor extends JFrame  {
    
    JFrame j ; 
    JButton [] buttons ; 
    JPanel h ;
    public GUIEditor(){
    
         j  = new JFrame("Prefrences editor");
         j.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
         Container c = j.getContentPane();
         c.setLayout(new BorderLayout());
         h  = new JPanel();
         j.setSize(400,400);
         JMenuBar menu  = new JMenuBar();
         JMenu m = new JMenu("Help");
         JMenuItem help = new JMenuItem("Tools");
         m.add(help);
         menu.add(m);
         h.add(menu,BorderLayout.PAGE_START);
         j.setBackground(Color.LIGHT_GRAY);
         
         
         buttons = new JButton[10];
         
         HashMap <String,Integer> featurenames = new HashMap<>();
         featurenames.put("background", 000000);
         featurenames.put("foreground",789800) ;
         featurenames.put("titlefontsize",24);
         featurenames.put("questionsize",20);
         String [] backgrounds = { "Gray", "White" , "Blue"};
         Integer [] Titlefontsize = {3,4,5,6,8,9,10,11,12,14,15,16};
         Integer [] Questionsize = { 6,7,8,10,11,12,12,2};
         
         JComboBox backgroundColorList = new JComboBox(backgrounds);
         h.add(backgroundColorList);
         JComboBox ForegroundColorList = new JComboBox(backgrounds);
         h.add(ForegroundColorList);
         JComboBox titlefontsize = new JComboBox(Titlefontsize);
         h.add(titlefontsize);
         JComboBox questionsize = new JComboBox(Questionsize);
         h.add(questionsize);
         JButton button1 = new JButton("Set Background");
         JButton button2 = new JButton("Set Foreground");
         JButton button3 = new JButton("Title Fontsize");
         JButton button4 = new JButton("Question Fontsize");
         
         h.add(button1);
         h.add(button2);
         h.add(button3);
         h.add(button4);
         h.add(backgroundColorList,BorderLayout.CENTER);
         j.add(h);
         j.setResizable(true);
         j.setVisible(true);
        
         
          
    }
    
    
    
    
    
    public static void main(String [] args){
        
        new GUIEditor();
    
    
    }
    
    
    
    
}
