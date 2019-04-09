/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fraction;

/*
Author: Monami Mukhopadhyay
Program: HW3b - Fraction
*/
public class Fraction {
    private int num,den;
    
    public Fraction(){
        num=0;
        den=1;
    }
    
    public Fraction(int n){
        num=n;
        den=1;
    }
    
    public Fraction(int n,int d){
        num=n;
        den=d;
        int g = gcd(num,den);
        if (g>0)
        {
	  num /= g;
	  den /= g;
        }
    }
    
    int gcd(int a, int b){
      int gcd=1;
      if (Math.abs(a)==1||Math.abs(b)==1)
      {
	gcd=1;
      }
      else
      {
	for(int i= 1;i<=a&&i<=b;i++)
	  {
	    if((a%i==0)&&(b%i==0))
	      {
		gcd = i;
	      }
	  }
      }
    return gcd;
    }
    
    public String toString(){
        return num + "/" + den;
    }    
    
    public Fraction add(Fraction b){
        return new Fraction(num*b.den+b.num*den,den*b.den);
    }
    
    public Fraction sub(Fraction b){
        return new Fraction(num*b.den-b.num*den,den*b.den);
    }
    
    public Fraction neg(){
        return new Fraction(-num,den);
    }
    
    public Fraction times(Fraction b){
        return new Fraction(num*b.num,den*b.den);
    }

    public static void main(String[] args) {
        Fraction a = new Fraction(1,2);
        Fraction b = new Fraction(1,3);
        System.out.println(a);
        System.out.println(b);
        Fraction c = a.add(b);
        Fraction d = a.sub(b);
        Fraction e = a.neg();
        Fraction f = a.times(b);
        System.out.println(c);
        System.out.println(d);
        System.out.println(e);
        System.out.println(f);
    }
    
}
