package quiz;

/**
 * @author dkruger
 */
public class ShortAnswerQuestion extends Question {
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
