package quiz;

/**
 * @author edytioco
 */
public class MultipleChoiceQuestion extends Question {
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
