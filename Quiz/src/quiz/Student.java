package quiz;

import java.util.HashMap;

/**
 *
 * @author dkruger
 */
public class Student {
    private long id;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    private HashMap<Quiz, Double> scores;
    
    public Student() {
        id = -1;
        scores = new HashMap<>();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
    public double getScore(Quiz q) {
        Double score = scores.get(q);
        if (score != null)
            return score;
        return Double.NaN;
    }
}
