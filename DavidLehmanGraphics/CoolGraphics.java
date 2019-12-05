//package com.stevens.edu.CoolGraphics;
// Reference - http://popscan.blogspot.com/2012/04/fisheye-lens-equation-simple-fisheye.html
// Reference - https://stackoverflow.com/questions/8662349/convert-negative-image-to-positive
// Reference - https://alvinalexander.com/blog/post/jfc-swing/complete-java-program-code-open-read-display-image-file
// In order to run this projcet, it is required to install javafx
// Link - https://gluonhq.com/products/javafx/
// Link for Intellij - https://www.jetbrains.com/help/idea/javafx.html

import com.sun.media.jfxmediaimpl.platform.Platform;
import com.sun.prism.Image;
import javafx.embed.swing.JFXPanel;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;
import java.nio.Buffer;
import java.util.concurrent.CountDownLatch;
import javax.swing.JComponent;

public class CoolGraphics extends JFrame {

    int width;
    int height;

    public CoolGraphics() throws IOException {
        super("CoolGraphics");

        URL imageURL = new URL("https://avatars1.githubusercontent.com/u/4974464?s=400&v=4");
        BufferedImage originalImage = ImageIO.read(imageURL);

        width = originalImage.getWidth();
        height = originalImage.getHeight();

        int[] originalPixels = new int[height * width];
        originalImage.getRGB(0,0,width,height,originalPixels,0,width);
        int[] transformedPixels = fisheye(originalPixels,width,height);

        ImageIcon imageIcon = new ImageIcon(originalImage);
        JLabel originalJLabel = new JLabel();
        originalJLabel.setIcon(imageIcon);
        getContentPane().add(originalJLabel,BorderLayout.CENTER);

        BufferedImage finalImage = ImageIO.read(imageURL);
        finalImage.setRGB(0,0,width,height,transformedPixels,0,width);

        imageIcon = new ImageIcon(finalImage);
        JLabel jLabel = new JLabel();
        jLabel.setIcon(imageIcon);
        getContentPane().add(jLabel,BorderLayout.CENTER);

        JTabbedPane tabbedPane = new JTabbedPane();
        setContentPane(tabbedPane);

        tabbedPane.addTab("Original Image", new JScrollPane(originalJLabel));
        tabbedPane.addTab("Distorted Image", new JScrollPane(jLabel));

        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private static int[] fisheye(int[] originalPixels, double width, double height){
        int[] distortedPixels = new int[(int) (width * height)];

        for(int i = 0; i < height; i++){
            double normalizedY = ((2 * i) / height) - 1.0;
            double normalizedYSquared = normalizedY * normalizedY;

            for(int j = 0; j < width; j++){
                double normalizedX = ((2 * j) / width) - 1.0;
                double normalizedXSquared = normalizedX * normalizedX;

                double radius = Math.sqrt(normalizedYSquared * normalizedYSquared);

                if(radius >= 0.0 && radius <= 1.0){
                    double normalizedRadius = Math.sqrt(1.0 - (radius * radius));
                    normalizedRadius = (radius + (1.0 - normalizedRadius)) /2.0;

                    if(normalizedRadius <= 1.0){
                        double theta = Math.atan2(normalizedY,normalizedX);
                        double newNormalizedX = normalizedRadius * Math.cos(theta);
                        double newNormalizedY = normalizedRadius * Math.sin(theta);

                        int newX = (int) (((newNormalizedX + 1) * width) / 2.0);
                        int newY = (int) (((newNormalizedY + 1) * height) / 2.0);

                        int sourcePosition = (int) (newY * width + newX);

                        if(sourcePosition >= 0 && sourcePosition < (width * height))
                            distortedPixels[(int) (i * width + j)] = originalPixels[sourcePosition];
                    }
                }
            }
        }

        return distortedPixels;
    }

    public static void main(String[] args) throws IOException {
        new CoolGraphics();
    }
}
