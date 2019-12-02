package quiz;

import java.util.*;

/**
 * @author dkruger Represent an assessment Which has a list of questions of
 *         different types Each question will have associated answers
 */
public class Quiz {
    private ArrayList<Question> questions;
    private ArrayList<Answer> answers;
    public Quiz() {
        questions = new ArrayList<>();
        answers = new ArrayList<>();
    }
    
    public void setQuestions(ArrayList<Question> q) {
       questions = q;
    }
    
    public ArrayList<Question> getQuestions() {
       return questions;
    }
    
    public void setAnswer(ArrayList<Answer> a) {
        answers = a;
    }
    
    public ArrayList<Answer> getAnswer() {
        return answers;
    }
    
    public void add(Question q) {
        questions.add(q);
    }
    
    public void add(Answer a) {
        answers.add(a);
    }
    
    public static Quiz quiz1;
    public static Quiz quiz2;
    static {
        quiz1 = new Quiz();
        Question q = new NumericQuestion();
        q.setMin(5); // set the number as the examiner wants 
        q.setMax(10); // set the number as the examminer wants
        q.setQuestion("What is the correct Integer in this range: " + "[" + q.getMin() + "," + q.getMax() + "] ?"); 
        Answer a = new Answer();
        Answer b = new Answer();
        a.setText("8"); // depends on the Student
        if (q.isCorrect(a.getText())) {
           b.setText("Right");
        } else {
            b.setText( "Wrong");
        }
        q.setAnswer(a);
        quiz1.add(q);
        quiz1.add(a);
        quiz1.add(b);
        /*q = new ShortAnswerQuestion();
        q.setQuestion("What is 2 + 2");
        Answer a = new Answer();
        a.setText("4");
        q.setAnswer(a);
        quiz1.add(q); 
        quiz1.add(a);
        */
       
        /* q = new ShortAnswerQuestion();
        q.setQuestion("What Department offers CPE552?");
        a = new Answer();
        a.setText("ECE");
        q.setAnswer(a);
        quiz1.add(q);  
        */
    }
}
