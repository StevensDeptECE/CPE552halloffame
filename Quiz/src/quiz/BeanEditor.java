package quiz;
import javax.swing.*;
import java.awt.*;
import java.lang.reflect.*;
/**
 * @author dkruger
 */
public class BeanEditor extends JPanel {
    public BeanEditor(Object obj) {
        setBean(obj);
    }
    
    public void setBean(Object obj) {
        Class c = obj.getClass();
        Method[] methods = c.getMethods();
        ArrayList<String> getters = new ArrayList<>();
        ArrayList<String> setters = new ArrayList<>();
        for (Method m : methods) {
            String name = m.getName();
            System.out.println(name);
            if (name.startsWith("get"))
                getters.add(name);
            else if (name.startsWith("set"))
                setters.add(name);
        }
    }
    public static void main(String[] args) {
        Student s = new Student();
        new BeanEditor(s);
        
    }
    
}
