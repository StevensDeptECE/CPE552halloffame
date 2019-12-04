package quiz;

import java.awt.*;
import javax.swing.*;
import java.util.*;

/**
 *
 * @author dkruger
 */

public class QuestionViewer extends JPanel {
	private Quiz quiz; // current quiz, null if not taking one
	private Student student; // student logged in
	private double score; // score of the current quiz
	private int questionNum;
        //private HashMap<Class, QuestionViewer> viewMap;
        
        public QuestionViewer() {
        // viewMap.put(MultipleChoiceQuestion.class, new MultipleChoiceQuestionViewer());
        // viewMap.put(NumericQuestion.class, new NumericQuestionViewer());
        }

	public void setQuiz(Quiz q) {
		quiz = q;
		score = 0;
		questionNum = 0;
	}

	public Quiz getQuiz() {
		return this.quiz;
	}
	
	public int getQuestionNum() {
		return questionNum;
	}
	
        public void QuestionNumplusone() {
		questionNum ++;
	}
	
        public void QuestionNumminusone() {
		questionNum --;
	}
	
        @Override
	public void paint(Graphics g) {
		var q = quiz.getQuestions().get(questionNum);
		String question = q.getQuestion();
		g.drawString(question, 15, 100);
//		q = quiz.getQuestions().get(questionNum + 1);
//		question = q.getQuestion();
//		g.drawString(question, 15, 200);
	}
}
