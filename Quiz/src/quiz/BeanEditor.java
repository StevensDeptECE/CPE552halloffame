package quiz;
import javax.swing.*;
import java.awt.*;
import java.lang.reflect.*;
import java.util.*;
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
        HashSet<String> getters = new HashSet<>();
        ArrayList<String> setters = new ArrayList<>();
        for (Method m : methods) {
            String name = m.getName();
            //System.out.println(name);
            if (name.startsWith("get"))
                getters.add(name);
            else if (name.startsWith("set"))
                setters.add(name);
        }
        for (String s : setters) {
            String getter = "get" + s.substring(3);
            if (getters.contains(getter))
                System.out.println(getter);
        }
    }
    public static void main(String[] args) {
        Student s = new Student();
        new BeanEditor(s);
        
    }
    
}
