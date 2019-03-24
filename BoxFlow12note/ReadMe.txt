/ Author: Wang Jinge
   Date: 3/19/2019   first write: 5/20/2017 by Wang Jinge

   This program is based on "minim" library, create 3D boxes with lines, and can shine dynamic shine with music.
   You can change the box、line and music as you want.
   Made some change and improvement from my course design at undergraduate.
   
/
1.This processing program need to download the third-party library "minim" before running.
2.Press space key to change the model between "play" and "edit", the default model is "edit" 
3.In edit model use left mouse button to change the vertex of cube. and use right mouse button to change the vertex of the line.
4.The music file is in the "data" package named "1.mp3",you can change the music ,but this program maybe only suitble for this music such can play a perfect result.
5.Please don`t change the vertex when at the end of the music.

Thank you!

/ 作者：王金阁
	该程序建立的盒堆模型，盒板和边线可以根据音乐节奏和频率动态变化，改变颜色。
	基于“MINIM”库，盒堆的模型为本科时本人所写。
/
1.需要在运行前，在环境中安装第三方库minim，该库提供读取音频文件相关参数的功能。
2.按空格键切换模式。（运行模式和调整模式）
3.在调整模式中可以用鼠标左边改变盒子顶点，鼠标右键改变线条顶点。
4.音乐文件保存在Data文件夹中，该程序目前是为此钢琴曲量身定做，改变音乐得到的效果并不一定会好。
5.在音乐将要结束时请勿进行点位调整。

/**
盒子的数量在boxVertex.json文件里改
线条的数量，顶点数在flowVertex.json文件里改
json文件用写字板打开，修改。
点位被拖拽过以后，ctrl+s保存。
**/

