package quiz;

import java.util.*;

/*
 * by PeizeYu, github ID AOIRA
 * users should use setquestion(String s) to add questions into arraylist, and use getquestion(int n) to get the nth question
 * so do answers
 */
public class FillBlanksQusetions {
	String name;
	ArrayList<String> questions = new ArrayList<>();
	ArrayList<String> answers = new ArrayList<>();
	FillBlanksQusetions(String name){
		this.name = name;
	}
	public void setquestion(String s) {		questions.add(s);	}	
	public String getquestion(int n) {		return questions.get(n);	}
	
	public void setanswer(String s) {		answers.add(s);}
	public String getanswer(int n) {		return answers.get(n);	}
	
}
