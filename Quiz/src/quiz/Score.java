import java.util.HashMap;

/**
 *
 * @yinghao wu   Jianyu wang 
 */
public class Scores entends Quiz {
    private String quizName; 
    private HashMap<Question, Double> scores;

    public long getQuestionScores() {
        return scores;
    }

    public long getScore() {
        return scores;
    }

    public void setScores(double score) {
        this.scores = score;
    }

    public HashMap<Quiz, Double> getScores() {
        return scores;
    }

    public void setScores(HashMap<Quiz, Double> scores) {
        this.scores = scores;
    }
    public void setScore(Quiz q, double score) {
        scores.put(q, score);
    }
    public double getScores(Quiz q) {
        Double score = scores.get(q);
        if (score != null)
            return score;
        return Double.NaN;
    }
}
