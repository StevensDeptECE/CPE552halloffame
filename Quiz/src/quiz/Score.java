import java.util.HashMap;

/**
 *
 * @yinghao wu   Jianyu wang 
 */
public class Scores entends JPanel {
    private double Scores;
    private String quizName;

    public String getquizName() {
        return quizName;
    }

    public void setquizName(String name) {
        this.quizName = name;
    }
    private HashMap<Quiz, Double> scores;
    

    public long getScores() {
        return Scores;
    }

    public void setScores(double Score) {
        this.Scores = Scores;
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
