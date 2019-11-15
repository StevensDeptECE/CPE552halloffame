/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codingquestioncompiler;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.BufferedOutputStream;
import java.io.OutputStreamWriter;
import java.io.OutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.util.regex.*;
import java.util.*;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;

/**
 *
 * @author mycicle
 */


//the objective of this is to make a java bean which takes in text input from somewehre external
//and is then able to take that text and compile it as java code
//and then return a string of the errors or output
public class CodingQuestionCompiler {
    private String text;
    private InputStream output;
    private File file;
    private FileOutputStream fop;
    private byte[] textBytes;
    private StringBuilder sb;
    boolean success = false;
    public CodingQuestionCompiler() {} //This is going to return nothing because it is a bean
    
    public String getText() { return this.text; } //this is probably gong to be for debugging purposes
                                //it will return the text stored inthis object as the original java code
    
    public void setText(String text) {
        try {
            this.file = file = new File("Vec3d.java");
            this.fop = new FileOutputStream(this.file);
            
            if (!this.file.exists()){
                file.createNewFile();
            }
            this.text = text;
            this.textBytes = this.text.getBytes();
            
            this.fop.write(textBytes);
            this.fop.flush();
            this.fop.close();
            
            System.out.println("Code written to file");
            
        } catch (Exception e){
            e.printStackTrace();
        }
    }  //This will be used to set the internal text object which represents the java code 
                                //the most crucial part of this method is the inpt and output formats. if it is string and string that would 
                                //be easiest, however, this may not be the optimal way to do it
    
        public void compile(String fileName) throws Exception {
            
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();

    //      DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<JavaFileObject>();

            StandardJavaFileManager fileManager = compiler.getStandardFileManager(null/*diagnostics*/, null, null);

            Iterable<? extends JavaFileObject> compilationUnits = fileManager.getJavaFileObjectsFromStrings(Arrays.asList(fileName + ".java"));

            JavaCompiler.CompilationTask task = compiler.getTask(null, fileManager, null/*diagnostics*/, null, null, compilationUnits);

            this.success = task.call();

            fileManager.close();

        System.out.println("Success: " + success);
        
    }  //This will be the method to compile the text stored in this objects text element. it will most probably 
                                //set the output variable of this object, however, set output will prbably be a private setter funtion
    
    public StringBuilder getFileOutput(){
        if(success == true){
        try{
                Runtime r = Runtime.getRuntime();
                //Process proc = r.exec("javac " + "Vec3d.java");
                Process proc = r.exec("java " + "Vec3d");
                this.output = proc.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(this.output));
                this.sb = new StringBuilder();
                String str;
                while((str = br.readLine()) != null){
                   this.sb.append(str+'\n');
               }
           }

        catch(Exception e){
            e.printStackTrace();
        }
        
        return this.sb;
        }
        else{
            System.out.println("Didn't compile");
            return null;
        }
    }
    
    

    public InputStream getOutput() { return this.output; }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception{
        // TODO code application logic here
        
        
        CodingQuestionCompiler q  = new CodingQuestionCompiler();
        //QUICK ADN DIRTY    JUST SET THE TEXT TO A FUNCTIONING JAVA PROGRAM
        q.setText("public class Vec3d {\n" +
"    private double x, y, z;\n" +
"    \n" +
"    //-------------------------------------------------------------\n" +
"    public Vec3d(double xi, double yi, double zi){\n" +
"        x = xi;\n" +
"        y = yi;\n" +
"        z = zi;\n" +
"    }\n" +
"    public Vec3d(){\n" +
"        //calls the constructor to send back a 0,0,0 vector\n" +
"        this(0,0,0);\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public double getX(){\n" +
"        return this.x;\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"     public double getY(){\n" +
"        return this.y;\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"      public double getZ(){\n" +
"        return this.z;\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public Vec3d add(Vec3d a){\n" +
"        //to add two vectors  \n" +
"        //add the x y and z components to get your new vector\n" +
"        return new Vec3d(this.x+a.x, this.y+a.y, this.z+a.z);\n" +
"    }\n" +
"    public static Vec3d add(Vec3d a, Vec3d b){\n" +
"        return new Vec3d(a.x+b.x, a.y+b.y, a.z+b.z);\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public Vec3d sub(Vec3d a){\n" +
"        return new Vec3d(this.x-a.x, this.y-a.y, this.z-a.z);\n" +
"    }\n" +
"    public static Vec3d sub(Vec3d a, Vec3d b){\n" +
"        return new Vec3d(a.x-b.x, a.y-b.y, a.z-b.z);\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public double dot(Vec3d a){\n" +
"        return (this.x*a.x + this.y*a.y + this.z*a.z);\n" +
"    }\n" +
"    public static double dot(Vec3d a, Vec3d b){\n" +
"        return (a.x*b.x + a.y*b.y + a.z*b.z);\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public Vec3d cross(Vec3d a){\n" +
"        return new Vec3d((this.y*a.z)-(this.z*a.y), \n" +
"                         (this.z*a.x)-(this.x*a.z), \n" +
"                         (this.x*a.y)-(this.y*a.x));\n" +
"    }\n" +
"    public static Vec3d cross(Vec3d a, Vec3d b){\n" +
"        return new Vec3d((a.y*b.z)-(a.z*b.y), \n" +
"                         (a.z*b.x)-(a.x*b.z), \n" +
"                         (a.x*b.y)-(a.y*b.x));\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public Vec3d toUnitVector(){\n" +
"        double mag = java.lang.Math.sqrt(x*x + y*y + z*z);\n" +
"        return divide(this, mag);\n" +
"    }\n" +
"    public static Vec3d toUnitVector(Vec3d v){\n" +
"        double mag = java.lang.Math.sqrt(v.x*v.x + v.y*v.y + v.z*v.z);\n" +
"        return divide(v, mag);\n" +
"    }\n" +
"      //-------------------------------------------------------------\n" +
"        public double magnitude(){\n" +
"        double mag = java.lang.Math.sqrt(x*x + y*y + z*z);\n" +
"        return mag;\n" +
"    }\n" +
"    public static double magnitude(Vec3d v){\n" +
"        double mag = java.lang.Math.sqrt(v.x*v.x + v.y*v.y + v.z*v.z);\n" +
"        return mag;\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"        public Vec3d divide(double mag){\n" +
"        x = x/mag;\n" +
"        y = y/mag;\n" +
"        z = z/mag;\n" +
"        return new Vec3d(x,y,z);\n" +
"    }\n" +
"    public static Vec3d divide(Vec3d v, double mag){\n" +
"        v.x = v.x/mag;\n" +
"        v.y = v.y/mag;\n" +
"        v.z = v.z/mag;\n" +
"        return new Vec3d(v.x,v.y,v.z);\n" +
"    }\n" +
"     //-------------------------------------------------------------\n" +
"     public Vec3d multiply(double mag){\n" +
"         Vec3d result = new Vec3d(x*mag, y*mag, z*mag);\n" +
"         return result;\n" +
"     }\n" +
"     public static Vec3d multiply(Vec3d v, double mag){\n" +
"         Vec3d result = new Vec3d(v.x*mag, v.y*mag, v.z*mag);\n" +
"         return result;\n" +
"     }\n" +
"     //-------------------------------------------------------------\n" +
"    public String toString(){\n" +
"        return \"<\"+this.x+\",\"+this.y+\",\"+this.z+\">\";\n" +
"    }\n" +
"    //-------------------------------------------------------------\n" +
"    public static void main(String[] args){\n" +
"        Vec3d a = new Vec3d(1,2,3);\n" +
"        Vec3d b = new Vec3d(1,2,3);\n" +
"        Vec3d c = new Vec3d(3,7,8);\n" +
"        \n" +
"        System.out.println(a);\n" +
"        System.out.println(b);\n" +
"        System.out.println(c);\n" +
"        \n" +
"        System.out.println(a.add(b));\n" +
"        System.out.println(add(a,b));\n" +
"        System.out.println(add(c,b));\n" +
"        \n" +
"        System.out.println(a.sub(b));\n" +
"        System.out.println(sub(a,b));\n" +
"        System.out.println(sub(a,c));\n" +
"        \n" +
"        System.out.println(a.dot(b));\n" +
"        System.out.println(dot(a,b));\n" +
"        System.out.println(dot(c,b));\n" +
"        \n" +
"        //The cross product of parallel vectors is 0\n" +
"        System.out.println(a.cross(b));\n" +
"        System.out.println(cross(a,b));\n" +
"        System.out.println(cross(a,c));\n" +
"        \n" +
"        System.out.println(magnitude(a));\n" +
"        System.out.println(toUnitVector(a));\n" +
"    }\n" +
"}");
        
        
        
        //System.out.println(q.getText());
        q.compile("Vec3d");
        System.out.println(q.getFileOutput());
    }
    
}


    
//    public void compile() {
//        
//        try {
//            single.main(new String[0]);
//        } catch (Exception e) {
//            JOptionPane.showMessageDialog(null, e);
//        }
//        
//        
////        try{
////           Runtime r = Runtime.getRuntime();
////           Process proc = r.exec("javac " + "Vec3d.java");
////           
////           Process proc2 = r.exec("java " + "Vec3d");
////           this.output = proc2.getInputStream();
////               BufferedReader br = new BufferedReader(new InputStreamReader(this.output));
////               StringBuilder sb = new StringBuilder();
////               String str;
////               while((str = br.readLine()) != null){
////                   sb.append(str+'\n');
////               }
////               System.out.println(sb);
////           }
////
////        catch(Exception e){
////            e.printStackTrace();
////        }