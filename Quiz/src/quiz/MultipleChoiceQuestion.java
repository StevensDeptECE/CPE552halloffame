package quiz;
import java.util.*;
/**
 * @author edytioco
 */
public class MultipleChoiceQuestion extends Question {
    ArrayList<String> answerList = new ArrayList<>();
    Answer correct;
    int correctIndex;
    // print out question
    // print out potential answers
    
    
    
    // Answer: make an array of choices, with one identified as true
    
    // user has to enter his choice
        // make this a string input
    
    // ID what answer is correct is correct
    
    
    
    
    @Override
    public Answer getAnswer() {
        correct.setText(answerList.get(correctIndex)); // TODO: figure out how to set correct.
        return correct;
    }

    @Override
    public void setAnswer(Answer a) {
        answerList.add(correctIndex, a.getText());
    }
    
    // populate the 
    public void setWrongAnswers(Answer a){
        
    }
}