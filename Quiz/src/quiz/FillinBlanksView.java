package edu.stevens.chuck;

import java.util.*;

/*
 * by HejunZhan  github ID Chuckhejun
   pattern zhengxu ID zhengxu-eng
 */
public class FillinBlanksView {
	String name;
	public FillinBlanksView(String name){
		this.name = name;}
	ArrayList<String> StudentAnswers = new ArrayList<>();
	ArrayList<String> StandAnswers = new ArrayList<>();

	
	public void setStudentAnswers(String s) {		StudentAnswers.add(s);	}	
	public String getStudentAnswers(int n) {		return StudentAnswers.get(n);	}
	
	public void setStandAnswers(String s) {		StandAnswers.add(s);}
	public String getStandAnswers(int n) {		return StandAnswers.get(n);	}
	
}