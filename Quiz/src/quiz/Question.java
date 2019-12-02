package quiz;

/**
 * @author dkruger
 */
public abstract class Question {
    private String question;
    public Question() {}
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String q) {
        question = q;
    }
    public abstract Answer getAnswer();
    public abstract void setAnswer(Answer a);
    // you can comment the code below
    public boolean isCorrect(String userAnswer) {
        return false;
    }
    public void setMax(double max){};
    public void setMin(double min){};
    public double getMax(){return 0;};
    public double getMin(){return 0;};
}
