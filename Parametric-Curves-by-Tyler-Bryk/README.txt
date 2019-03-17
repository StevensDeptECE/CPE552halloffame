Author: Tyler Bryk
I pledge my honor that I have abided by the Stevens Honor System

Beautiful Graphics Project README
Three files are attached:
- ParametricCurvesProcessing.pde
- ParametricCurves.java
- ParametricCurvesSwing.java

A note about the project:

I attempted to replicate OpenProcessing.org's variant of the 3D Parametric Curves
A replica can be found in the file labeled ParametricCurvesProcessing.pde
In this file I added a color shifter which allows the curves to transform between all the visible colors and I modified the shape of the curves.

In the ParametricCurves.java file, I used the Processing API to replicate the curves in a java environment, however, I ran into trouble when trying to apply the color shifter. For some reason, the colorMode command would throw a nullPointer exception which I could not figure out. So rather than using a HSB color mode, I stuck with a traditional RGB transform.

Lastly, I wanted a challenge, so I attempted to recreate the Processing parametric curves in Java Swing which is shown in the file ParametricCurvesSwing.java. I was able to replicate the basic shape of the parametric curves and have them draw on the screen. But I noticed that the computer seems to execute the instructions much faster in Java Swing than in Processing which resulted in a poor rendering of the graphic. I thoroughly researched how to slow down the clock speed of my processor or how to slow down the execution time of my instructions but had no luck. I attached the file anyways to show my progress, but I am unhappy with the results. 