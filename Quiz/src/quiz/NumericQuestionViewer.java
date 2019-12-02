package quiz;
import java.awt.*;
import javax.swing.*;

/**
 *
 * @author Siyang Wu, Feng Liu
 */
public class NumericQuestionViewer extends JPanel {
        private Quiz quiz;
        private Student student;
        private double score;
        private int questionNum;
        private int answerNum;
        
        public NumericQuestionViewer() {} // default constructor
        
        public void setQuiz(Quiz q) {
		quiz = q;
		score = 0;
		questionNum = 0;
                 answerNum = 0;
	}
        
        public Quiz getQuiz() {
		return this.quiz;
	}
        
        public int getQuestionNum() {
		return questionNum;
	}
        
        public int getAnswerNum() {
           return answerNum; 
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
                var a = quiz.getAnswer().get(answerNum);
                var b = quiz.getAnswer().get(answerNum + 1);
		String question = q.getQuestion();
                 String answer = a.getText();
                 String result = b.getText();
		g.drawString(question, 15, 100);
                g.drawString(answer, 45, 150);
                g.drawString(result, 45, 200);
        }
        
}

