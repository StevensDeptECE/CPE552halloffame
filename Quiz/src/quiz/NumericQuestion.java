package quiz;

/**
 * @author xian96, YingHao Wu
 */
public class NumericQuestion extends Question {

    private double doubleAnswer;
    private double max, min;
    
    @Override
    public void setAnswer(Answer a) {
        doubleAnswer = Double.parseDouble(a.getText());
    }

    @Override
    public double getMax() {
        return max;
    }

    @Override
    public void setMax(double max) {
        this.max = max;
    }

    @Override
    public double getMin() {
        return min;
    }

    @Override
    public void setMin(double min) {
        this.min = min;
    }

    @Override
    public Answer getAnswer() {
        Answer answer = new Answer();
        answer.setText(String.valueOf(doubleAnswer));
        return answer;
    }
    
    @Override
    public boolean isCorrect(String userAnswer) {
        double ua = Double.parseDouble(userAnswer);
        return (ua >= min) && (ua <= max);
    }
}
