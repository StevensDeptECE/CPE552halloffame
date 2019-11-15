package quiz;

/**
 * @author xian96
 */
public class NumericQuestion extends Question {
    private Answer answer;

    @Override
    public Answer getAnswer() {
        return answer;
    }

    @Override
    public void setAnswer(Answer a) {
        answer = a;
    }
    
}