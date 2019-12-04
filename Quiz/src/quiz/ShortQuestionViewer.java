package quiz;

/**
 *
 * @author zichaox
 */
import javax.swing.*;

public class ShortQuestionViewer extends JPanel {
    private Quiz quiz;
    private int questionNum;
    private Student student; // student logged in
    private double score; 
    
    public ShortQuestionViewer() {
        
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
        questionNum++;
    }
    
    public void QuestionNumminusone() {
        questionNum--;
    }
    
    
}
