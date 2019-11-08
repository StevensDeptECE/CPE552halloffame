package quiz;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import javax.swing.*;
/**
 *
 * @author dkruger
 */
public class QuizWin extends JFrame {
    public QuizWin() {
        super("Quiz");
        setSize(1000,800);
        Container c = getContentPane();
        QuestionViewer viewer = new QuestionViewer();
        viewer.setQuiz(Quiz.quiz1);
        c.add(BorderLayout.CENTER, viewer);
        /*JScrollBar s =
                new JScrollBar(JScrollBar.HORIZONTAL,
                        0, 1, 0, quiz.getQuestions().size());
            c.add(BorderLayout.EAST, s);
          */
        JButton next = new JButton("Next");
        c.add(BorderLayout.EAST, next);
        JButton prev = new JButton("prev");
        c.add(BorderLayout.WEST, prev);
        
        
        
        addWindowListener(new WindowAdapter() {
           @Override
           public void windowClosing(WindowEvent e) {
               System.exit(0);
           }
        });
        setVisible(true);
    }
    public static void main(String[] args) {
        new QuizWin();
    }
}
