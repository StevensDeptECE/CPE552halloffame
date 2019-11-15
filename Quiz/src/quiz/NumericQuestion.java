package quiz;

/**
 * @author xian96
 */
public class NumericQuestion extends Question {

    private double doubleAnswer;

    @Override
    public void setAnswer(Answer a) {
        doubleAnswer =  Double.parseDouble(a.getText());
    }

    @Override
    public Answer getAnswer() {
        Answer answer = new Answer();
        answer.setText(String.valueOf(doubleAnswer));
        return answer;
    }

}
