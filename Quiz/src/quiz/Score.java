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

<<<<<<< HEAD
    public long getScore() {
        return scores;
=======
    public double getScores() {
        return Scores;
>>>>>>> f842e862e73697fe2282010d84963d3720ba4801
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
