package quiz;

import java.util.*;

/**
 * @author dkruger Represent an assessment Which has a list of questions of
 *         different types Each question will have associated answers
 */
public class Quiz {
	private ArrayList<Question> questions;

	public Quiz() {
		questions = new ArrayList<>();
	}

	public void setQuestions(ArrayList<Question> q) {
		questions = q;
	}

	public ArrayList<Question> getQuestions() {
		return questions;
	}

	public void add(Question q) {
		questions.add(q);
	}

	public static Quiz quiz1;
	public static Quiz quiz2;
	static {
		quiz1 = new Quiz();

		Question q = new ShortAnswerQuestion();
		q.setQuestion("What is 2 + 2");
		Answer a = new Answer();
		a.setText("4");
		q.setAnswer(a);
		quiz1.add(q);

		q = new ShortAnswerQuestion();
		q.setQuestion("What Department offers CPE552?");
		a = new Answer();
		a.setText("ECE");
		q.setAnswer(a);
		quiz1.add(q);
	}
}
