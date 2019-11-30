package session11;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.*;


public class shortAnswerWin extends JFrame{
	private Quiz quiz; // current quiz, null if not taking one
//	private Student student; // student logged in
//	private double score; // score of the current quiz
	private String answer;
	private int questionNum;

	public shortAnswerWin() {
			setSize(1000, 800);
			Container c = getContentPane();
			ShortAnswerView viewer = new ShortAnswerView();
			JLabel label = new JLabel("Hi ! Welcome to the Quiz ..");
			label.setBounds(100, 10, 350, 30);
			c.add(label);
			viewer.setQuiz(Quiz.quiz1);
			viewer.setLocation(100, 200);
			viewer.setSize(100, 100);

			JButton next = new JButton("Next");
			c.add(BorderLayout.EAST, next);
			JButton prev = new JButton("prev");
			c.add(BorderLayout.WEST, prev);
			JButton submit = new JButton("submit");
			c.add(BorderLayout.SOUTH,submit);
			

			
			
			JTextField jtf = new JTextField();
			jtf.setLocation(600, 300);
			jtf.setSize(100, 300);
			jtf.setVisible(true);
			jtf.setEnabled(true);
			
			c.add(viewer);
			c.add(jtf);
			prev.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					if(viewer.getQuestionNum()>0) {
						viewer.QuestionNumminusone();
						repaint();
					}
					else {
						System.out.println("this is the first question");
					}
				}
				
			});
			
			next.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {
					if (viewer.getQuiz().getQuestions().size() > viewer.getQuestionNum() + 1) {
						viewer.QuestionNumplusone();
						repaint();
					} else {
						System.out.println("this is the last question");
					}

				}

			});
			
			addWindowListener(new WindowAdapter() {
				@Override
				public void windowClosing(WindowEvent e) {
					System.exit(0);
				}
			});
			setVisible(true);
	}
	public static void main(String[] args) {
		new shortAnswerWin();
	}
}
class ShortAnswerView extends JPanel {
	private Quiz quiz; // current quiz, null if not taking one
//	private Student student; // student logged in
//	private double score; // score of the current quiz
	private String answer;
	private int questionNum;

	public ShortAnswerView() {
	}

	public void setQuiz(Quiz q) {
		quiz = q;
//		score = 0;
		questionNum = 0;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public Quiz getQuiz() {
		return this.quiz;
	}
	
	public int getQuestionNum() {
		return questionNum;
	}
	public void QuestionNumplusone() {
		questionNum++;
	}
	public void QuestionNumminusone() {
		questionNum--;
	}
	
	public void paint(Graphics g) {
		Question q = quiz.getQuestions().get(questionNum);
		String question = q.getQuestion();
		g.drawString(question, 15, 100);
	}

}
