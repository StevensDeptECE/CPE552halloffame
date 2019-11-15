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
    public abstract double checkAnswer(String a); // 0.0 = wrong, 1.0 = full credit
}
