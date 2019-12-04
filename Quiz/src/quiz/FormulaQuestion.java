package Quiz;

import java.util.*;
import javax.script.*;

//Author: Donglin Chen & Chenhui Yang

class FormulaQuestion extends Question{
	private String question;
	
	private String[] fq;
	private String formula, answer;
	private int realX, realY;
	private Answer answer2 = new Answer();
	private ArrayList<Integer> valueX, valueY;
	
	public FormulaQuestion() {
		question = null;
		valueX = new ArrayList<> ();
		valueY = new ArrayList<> ();
	}
    
	//Pick random x and y from the ranges of x, y that you set, Creating the Question.
    public void setQuestion(String q) {
        fq = q.split(";");
        question = fq[0];
        formula = fq[1].substring(fq[1].indexOf("=")+1);
        String[] fq2 = fq[2].split("[\\D]+");
        String[] fq3 = fq[3].split("[\\D]+");
        for(int i = 1; i < fq2.length; i++)
            valueX.add(Integer.parseInt(fq2[i]));
        for(int i = 1; i < fq3.length; i++)
            valueY.add(Integer.parseInt(fq3[i]));   
        realX = valueX.get((int)(Math.random()*valueX.size()));
        realY = valueY.get((int)(Math.random()*valueY.size()));
        question = question.replace("'x'", realX + "");
        question = question.replace("'y'", realY + "");
    }
    
    //Return the question created automatically
    public String getQuestion() {
        if(question.equals(null)) System.out.println("No question here, please set question firstly!"); 
    	return question;
    }
    
    //Method to create answer automatically (by Method stringToCalculate)
    public void setAnswer(){
    	formula = formula.replace('x', (char)(realX + 48));
        formula = formula.replace('y', (char)(realY + 48));
        answer = stringToCalculate(formula);
        answer2.setText(answer);
    }
    
    //Method to set the answer by yourself, and it may not be used in FormulaQuestion
    public void setAnswer(Answer a) {
        answer2 = a;
    }
    
    //Return the answer if it exists
    public Answer getAnswer(){
        if(!answer2.getText().equals(null)) return answer2;
        else System.out.println("You haven't set the answer. Please use setAnswer() firstly!");
        return null;
    }
    
    //Method to check the answer
    public double checkAnswer(String a){
    	a = a.replaceAll("\\s+", "");
    	if(a.equals(answer))
            return 1.0;
        return 0.0;  
    }
    
    //Method to transfer the string formula to real formula and calculate the result
    public String stringToCalculate(String a){
        ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
        ScriptEngine scriptEngine = scriptEngineManager.getEngineByName("nashorn");
        String expression = a;
        try {
            String result = String.valueOf(scriptEngine.eval(expression));
            //System.out.println(result);
            return result;
        } catch (ScriptException e) {
            e.printStackTrace();
        }
        return "";
    }
    
    public static void main(String[] args){
        FormulaQuestion q = new FormulaQuestion();
        //Setting the question. (NOTE: It must use the ";" to separate different part)
        //Eg: Question(use 'x' and 'y' to replace the available) ; the formula of question ; range of x; range of y.
        q.setQuestion("one small bottle can hold 'x' ounces water, and one big bottle can hold 'y' ounces water, how many aunces of water can 3 small bottle and 2 big bottle hold?; f(x,y)=3*x+2*y; x=[1,3,5]; y=[6,8]");
        //Check every part. it would create the different question and answer every time you run it.
        System.out.println(q.getQuestion());
        System.out.println(q.formula);
        q.setAnswer();
        System.out.println(q.formula);
        System.out.println(q.answer); 
    }
}


