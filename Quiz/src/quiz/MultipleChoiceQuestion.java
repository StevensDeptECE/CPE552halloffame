package quiz;
import java.util.*;
/**
 * @author edytioco
 */
public class MultipleChoiceQuestion extends Question {
    private ArrayList<Answer> answerList = new ArrayList<>();
    private int correctIndex = 0;
    // TODO: figure out how to set correct. should correct answer always be first?
    // print out question
    // print out potential answers
    
    // user has to enter his choice
    // make this a string input
    
    
    
    
    
    @Override
    public Answer getAnswer() {
        return answerList.get(correctIndex);
    }

    @Override
    public void setAnswer(Answer a) {
        answerList.add(correctIndex, a);
    }
    
    @Override
    public double checkAnswer(String a){
        if (getAnswer().getText().equals(a))
            return 1.0;
        else
            return 0.0;
    }
    public ArrayList<Answer> getAnswers(){
        return answerList;
    }
    
    public void setAnswers(ArrayList<Answer> list){
        for (Answer a : list){
            answerList.add(a);
        }
    }
    
    
    
}